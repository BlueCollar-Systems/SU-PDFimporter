# bc_pdf_vector_importer/xobject_parser.rb
# Form XObject parser — detects reusable content blocks in PDFs
# and maps them to SketchUp Component Definitions.
#
# Many CAD PDFs reuse geometry through Form XObjects (repeated elements,
# symbols, repeated details, title block elements). This parser
# identifies them and creates SketchUp components placed as instances,
# dramatically reducing model size and enabling easy editing.
#
# Copyright 2024 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    class XObjectParser

      # Represents a reusable Form XObject
      FormXObject = Struct.new(
        :obj_num,       # PDF object number
        :name,          # Resource name (e.g., "Fm0", "X1")
        :bbox,          # Bounding box [x0, y0, x1, y1]
        :matrix,        # Optional transformation matrix [a,b,c,d,e,f]
        :stream_data,   # Decoded content stream
        :usage_count,   # How many times this XObject is referenced
        :paths,         # Parsed vector paths (lazy, filled on first use)
        :instance_xforms # Array of CTM transforms where Do is called
      )

      attr_reader :form_xobjects  # { name => FormXObject }

      def initialize(pdf_parser)
        @pdf = pdf_parser
        @form_xobjects = {}
      end

      # ---------------------------------------------------------------
      # Scan a page's resources for Form XObjects
      # ---------------------------------------------------------------
      def scan_page(page_num)
        page_data = @pdf.page_data(page_num)
        return unless page_data

        # We need to access the page object's /Resources /XObject dict
        # This requires reaching into the parser a bit
        page_ref = @pdf.instance_variable_get(:@pages)[page_num - 1]
        return unless page_ref

        page_obj = @pdf.resolve_object(page_ref)
        page_dict = to_dict(page_obj)
        return unless page_dict

        # Get resources — may be inherited from parent
        resources = find_inherited(page_dict, '/Resources')
        return unless resources

        res_dict = to_dict(@pdf.resolve_object(resources))
        return unless res_dict

        # Get XObject sub-dictionary
        xobj_ref = res_dict['/XObject']
        return unless xobj_ref

        xobj_dict = to_dict(@pdf.resolve_object(xobj_ref))
        return unless xobj_dict

        # Iterate over each XObject entry
        xobj_dict.each do |name, ref|
          next if name == '/Type' || name == '/Subtype'
          next unless ref.is_a?(String) && ref =~ /\A(\d+)\s+(\d+)\s+R\z/

          obj_num = $1.to_i
          xobj = @pdf.resolve_object(ref)
          xobj_d = to_dict(xobj)
          next unless xobj_d

          # Only process Form XObjects (not Image XObjects)
          subtype = xobj_d['/Subtype']
          next unless subtype == '/Form'

          # Extract BBox
          bbox = parse_array_nums(xobj_d['/BBox']) if xobj_d['/BBox']
          bbox ||= [0, 0, 100, 100]

          # Extract optional Matrix
          matrix = nil
          if xobj_d['/Matrix']
            matrix = parse_array_nums(xobj_d['/Matrix'])
          end

          # Get the stream content
          stream_data = @pdf.get_stream_data(obj_num)

          clean_name = name.to_s.gsub(/\A\//, '')

          form = FormXObject.new(
            obj_num,
            clean_name,
            bbox,
            matrix,
            stream_data,
            0,
            nil,
            []
          )

          @form_xobjects[clean_name] = form
        end
      end

      # ---------------------------------------------------------------
      # Count XObject references in content streams (Do operator)
      # ---------------------------------------------------------------
      def count_references(streams)
        return unless streams

        streams.each do |stream|
          next unless stream
          # Scan for "/<name> Do" patterns
          stream.scan(/\/(\S+)\s+Do/) do |match|
            name = match[0]
            if @form_xobjects[name]
              @form_xobjects[name].usage_count += 1
            end
          end
        end
      end

      # ---------------------------------------------------------------
      # Track where each Form XObject is used (capture CTM at Do time)
      # ---------------------------------------------------------------
      def track_placements(streams)
        return unless streams
        # This requires parsing the content stream with CTM tracking
        # We track q/Q state and cm operators to know the CTM at each Do
        ctm_stack = [[1, 0, 0, 1, 0, 0]]
        current_ctm = [1, 0, 0, 1, 0, 0]

        streams.each do |stream|
          next unless stream
          tokens = tokenize_stream(stream)
          operands = []

          tokens.each do |tok|
            if tok[:type] == :operator
              case tok[:value]
              when 'q'
                ctm_stack.push(current_ctm.dup)
              when 'Q'
                current_ctm = ctm_stack.pop || [1, 0, 0, 1, 0, 0]
              when 'cm'
                nums = operands.select { |t| t[:type] == :number }.map { |t| t[:value] }
                if nums.length >= 6
                  current_ctm = multiply_matrices(
                    current_ctm,
                    [nums[0], nums[1], nums[2], nums[3], nums[4], nums[5]]
                  )
                end
              when 'Do'
                name_tok = operands.find { |t| t[:type] == :name }
                if name_tok
                  name = name_tok[:value].gsub(/\A\//, '')
                  if @form_xobjects[name]
                    @form_xobjects[name].instance_xforms << current_ctm.dup
                    @form_xobjects[name].usage_count = @form_xobjects[name].instance_xforms.length
                  end
                end
              end
              operands.clear
            else
              operands << tok
            end
          end
        end
      end

      # ---------------------------------------------------------------
      # Parse the content stream of a Form XObject into vector paths
      # (lazy — only when needed for component creation)
      # ---------------------------------------------------------------
      def parse_xobject_paths(name)
        form = @form_xobjects[name]
        return [] unless form && form.stream_data

        # Re-use the content stream parser
        cs_parser = ContentStreamParser.new([form.stream_data], @pdf)
        paths = cs_parser.parse
        form.paths = paths
        paths
      end

      # ---------------------------------------------------------------
      # Get XObjects that are worth making into Components
      # (referenced more than once)
      # ---------------------------------------------------------------
      def reusable_xobjects(min_uses: 2)
        @form_xobjects.values.select { |f| f.usage_count >= min_uses }
      end

      private

      def to_dict(obj)
        return obj if obj.is_a?(Hash)
        if obj.is_a?(String) && obj.include?('<<')
          @pdf.send(:parse_dict_string, obj) rescue nil
        else
          nil
        end
      end

      def find_inherited(dict, key)
        return dict[key] if dict[key]
        if dict['/Parent']
          parent = @pdf.resolve_object(dict['/Parent'])
          parent_dict = to_dict(parent)
          return find_inherited(parent_dict, key) if parent_dict
        end
        nil
      end

      def parse_array_nums(val)
        if val.is_a?(Array)
          return val.map { |v| v.to_s.to_f }
        elsif val.is_a?(String)
          @pdf.send(:parse_array_string, val).map { |v| v.to_s.to_f } rescue []
        else
          []
        end
      end

      def multiply_matrices(m1, m2)
        [
          m1[0] * m2[0] + m1[1] * m2[2],
          m1[0] * m2[1] + m1[1] * m2[3],
          m1[2] * m2[0] + m1[3] * m2[2],
          m1[2] * m2[1] + m1[3] * m2[3],
          m1[4] * m2[0] + m1[5] * m2[2] + m2[4],
          m1[4] * m2[1] + m1[5] * m2[3] + m2[5]
        ]
      end

      def tokenize_stream(stream)
        tokens = []
        i = 0
        len = stream.length
        while i < len
          c = stream[i]
          if c =~ /[\s\x00]/; i += 1; next; end
          if c == '%'
            eol = stream.index(/[\r\n]/, i) || len
            i = eol + 1; next
          end
          if c == '/'
            j = i + 1
            while j < len && stream[j] !~ /[\s\[\]<>(){}\/\%]/; j += 1; end
            tokens << { type: :name, value: stream[i...j] }
            i = j; next
          end
          j = i
          while j < len && stream[j] !~ /[\s\[\]<>(){}\/\%]/; j += 1; end
          word = stream[i...j]
          if word =~ /\A[+-]?\d*\.?\d+\z/
            tokens << { type: :number, value: word.to_f }
          else
            tokens << { type: :operator, value: word }
          end
          i = j
        end
        tokens
      end

    end
  end
end
