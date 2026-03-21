# bc_pdf_vector_importer/svg_text_renderer.rb
# Renders PDF text as precise vector geometry using pdftocairo.
#
# Performance: each unique glyph is drawn ONCE as a Component, then
# placed as lightweight instances. ~500 draws + ~3000 placements
# instead of ~3000 individual draws.
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

require 'tmpdir'

module BlueCollarSystems
  module PDFVectorImporter
    module SvgTextRenderer

      PDF_PT_TO_INCH = 1.0 / 72.0

      def self.render(entities, pdf_path, page_num, media_box, opts = {})
        exe = find_pdftocairo
        return nil unless exe

        scale = opts[:scale] || 1.0
        origin_x = media_box[0].to_f
        origin_y = media_box[1].to_f
        page_h   = (media_box[3] - media_box[1]).abs

        svg_path = File.join(Dir.tmpdir,
          "bc_svg_#{Process.pid}_#{Time.now.to_i}_#{rand(100000)}.svg")

        args = [
          exe.to_s,
          '-svg',
          '-f', page_num.to_i.to_s,
          '-l', page_num.to_i.to_s,
          pdf_path.to_s,
          svg_path.to_s
        ]
        ok = system(*args)
        return nil unless ok && File.exist?(svg_path)

        svg = File.read(svg_path)
        glyphs = parse_glyph_defs(svg)
        placements = parse_use_placements(svg)
        return { edges: 0, glyphs: 0 } if placements.empty?

        model = entities.model || Sketchup.active_model
        edge_count = 0
        glyph_count = 0

        # Build each unique glyph as a Component (draw once)
        Sketchup.status_text = "Building #{glyphs.length} glyph shapes..."
        glyph_defs = {}
        glyphs.each do |glyph_id, path_d|
          next if path_d.strip.empty?
          subpaths = svg_path_to_points(path_d, scale)
          next if subpaths.empty?

          defn = model.definitions.add("_g_#{glyph_id}")
          subpaths.each do |pts|
            next if pts.length < 2
            begin
              r = defn.entities.add_edges(pts)
              edge_count += r.length if r
            rescue StandardError => e
              Logger.warn("SvgTextRenderer", "add_edges for glyph failed: #{e.message}")
            end
          end
          glyph_defs[glyph_id] = defn if defn.entities.count > 0
        end

        # Place instances (fast)
        total = placements.length
        placements.each_with_index do |p, idx|
          if idx % 500 == 0
            Sketchup.status_text = "Placing text: #{idx}/#{total} [#{((idx.to_f/total)*100).round}%]"
          end

          defn = glyph_defs[p[:glyph_id]]
          next unless defn

          pdf_x = p[:x] - origin_x
          pdf_y = (page_h - p[:y]) - origin_y
          x_inch = pdf_x * PDF_PT_TO_INCH * scale
          y_inch = pdf_y * PDF_PT_TO_INCH * scale

          begin
            entities.add_instance(defn,
              Geom::Transformation.new(Geom::Point3d.new(x_inch, y_inch, 0.0)))
            glyph_count += 1
          rescue StandardError => e
            Logger.warn("SvgTextRenderer", "add_instance for glyph failed: #{e.message}")
          end
        end

        { edges: edge_count, glyphs: glyph_count }
      rescue => e
        Logger.warn("SvgTextRenderer", "Failed: #{e.message}") rescue nil
        nil
      ensure
        begin
          File.delete(svg_path) if svg_path && File.exist?(svg_path)
        rescue StandardError => e
          Logger.warn("SvgTextRenderer", "cleanup temp svg failed: #{e.message}")
        end
      end

      private

      def self.find_pdftocairo
        env = ENV['BC_PDFTOCAIRO_PATH']
        return env if env && !env.empty? && File.exist?(env)

        begin
          if ENV['LOCALAPPDATA'] && !ENV['LOCALAPPDATA'].empty?
            miktex = File.join(ENV['LOCALAPPDATA'],
              'Programs', 'MiKTeX', 'miktex', 'bin', 'x64', 'pdftocairo.exe')
            return miktex if File.exist?(miktex)
          end
          g = 'C:\\Program Files\\MiKTeX\\miktex\\bin\\x64\\pdftocairo.exe'
          return g if File.exist?(g)
        rescue StandardError => e
          Logger.warn("SvgTextRenderer", "find_pdftocairo path search failed: #{e.message}")
        end

        if (RUBY_PLATFORM =~ /mswin|mingw|cygwin/)
          ['C:/poppler*/bin/pdftocairo.exe',
           'C:/tools/poppler*/bin/pdftocairo.exe'
          ].each do |pat|
            Dir.glob(pat).each { |p| return p if File.exist?(p) }
          end
        end

        begin
          if (RUBY_PLATFORM =~ /mswin|mingw|cygwin/)
            r = `where pdftocairo.exe 2>NUL`.strip
          else
            r = `which pdftocairo 2>/dev/null`.strip
          end
          return r.split("\n").first.strip if !r.empty?
        rescue StandardError => e
          Logger.warn("SvgTextRenderer", "find_pdftocairo which/where failed: #{e.message}")
        end
        nil
      end

      def self.parse_glyph_defs(svg)
        h = {}
        svg.scan(/<g id="(glyph-\d+-\d+)">\s*<path d="([^"]*)"/m) do |id, d|
          h[id] = d unless d.strip.empty?
        end
        h
      end

      def self.parse_use_placements(svg)
        a = []
        svg.scan(/<use xlink:href="#(glyph-\d+-\d+)" x="([^"]+)" y="([^"]+)"/) do |id, x, y|
          a << { glyph_id: id, x: x.to_f, y: y.to_f }
        end
        a
      end

      # Convert SVG path to arrays of SketchUp Point3d.
      # Glyph coords are in PDF points, Y-down. We flip Y and scale to inches.
      def self.svg_path_to_points(d, scale)
        tokens = d.scan(/[MLHVCSZmlhvcsz]|[-+]?\d*\.?\d+(?:[eE][-+]?\d+)?/)
        subpaths = []
        current = []
        start_pt = nil
        cx = 0.0; cy = 0.0
        cmd = nil; nums = []

        mk = lambda { |gx, gy|
          Geom::Point3d.new(gx * PDF_PT_TO_INCH * scale,
                            -gy * PDF_PT_TO_INCH * scale, 0.0)
        }

        run = lambda {
          case cmd
          when 'M'
            while nums.length >= 2
              subpaths << current if current.length >= 2
              cx, cy = nums.shift(2)
              start_pt = mk.call(cx, cy)
              current = [start_pt]
            end
          when 'L'
            while nums.length >= 2
              cx, cy = nums.shift(2)
              current << mk.call(cx, cy)
            end
          when 'H'
            while nums.length >= 1
              cx = nums.shift
              current << mk.call(cx, cy)
            end
          when 'V'
            while nums.length >= 1
              cy = nums.shift
              current << mk.call(cx, cy)
            end
          when 'C'
            while nums.length >= 6
              x1, y1, x2, y2, x, y = nums.shift(6)
              p0 = current.last || mk.call(cx, cy)
              p1 = mk.call(x1, y1); p2 = mk.call(x2, y2); p3 = mk.call(x, y)
              ch = p0.distance(p3)
              n = ch < 0.02 ? 2 : (ch < 0.08 ? 3 : 4)
              (1..n).each do |i|
                t = i.to_f / n; mt = 1.0 - t
                bx = mt**3*p0.x + 3*mt**2*t*p1.x + 3*mt*t**2*p2.x + t**3*p3.x
                by = mt**3*p0.y + 3*mt**2*t*p1.y + 3*mt*t**2*p2.y + t**3*p3.y
                current << Geom::Point3d.new(bx, by, 0.0)
              end
              cx, cy = x, y
            end
          when 'S'
            while nums.length >= 4
              _, _, x, y = nums.shift(4)
              cx, cy = x, y
              current << mk.call(cx, cy)
            end
          when 'Z'
            if current.last && start_pt && current.last.distance(start_pt) >= 0.0003
              current << start_pt
            end
            subpaths << current if current.length >= 2
            current = start_pt ? [start_pt] : []
          end
        }

        tokens.each do |tok|
          if tok =~ /\A[A-Za-z]\z/
            run.call if cmd
            cmd = tok.upcase
            nums = []
          else
            nums << tok.to_f
          end
        end
        run.call if cmd
        subpaths << current if current.length >= 2

        subpaths.map { |pts|
          cl = [pts.first]
          pts[1..-1].each { |p| cl << p if p.distance(cl.last) >= 0.0003 }
          cl.length >= 2 ? cl : nil
        }.compact
      end

    end
  end
end
