# bc_pdf_vector_importer/main.rb
# Pipeline: PDF > Primitives > Cleanup > Profile > Generic Recognition
#           > Optional Domain Pack > Validation > Host Build > Report
#
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

require 'zlib'

module BlueCollarSystems
  module PDFVectorImporter

    dir = File.dirname(__FILE__)
    # Core Engine
    require File.join(dir, 'primitives')
    require File.join(dir, 'logger')
    require File.join(dir, 'pdf_parser')
    require File.join(dir, 'content_stream_parser')
    require File.join(dir, 'text_parser')
    require File.join(dir, 'external_text_extractor')
    require File.join(dir, 'bezier')
    require File.join(dir, 'arc_fitter')
    require File.join(dir, 'ocg_parser')
    require File.join(dir, 'xobject_parser')
    require File.join(dir, 'primitive_extractor')
    require File.join(dir, 'unit_parser')
    require File.join(dir, 'dimension_parser')
    require File.join(dir, 'generic_classifier')
    require File.join(dir, 'document_profiler')
    require File.join(dir, 'region_segmenter')
    require File.join(dir, 'generic_recognizer')
    # Pipeline
    require File.join(dir, 'recognizer')
    require File.join(dir, 'validator')
    # Host Builders
    require File.join(dir, 'geometry_builder')
    require File.join(dir, 'geometry_cleanup')
    require File.join(dir, 'hatch_detector')
    require File.join(dir, 'stroke_font')
    require File.join(dir, 'svg_text_renderer')
    require File.join(dir, 'svg_geometry_renderer')
    require File.join(dir, 'metadata')
    # Tools & UI
    require File.join(dir, 'scale_tool')
    require File.join(dir, 'import_dialog')
    require File.join(dir, 'report_dialog')

    # ================================================================
    # SHARED PIPELINE — single source of truth for all import paths
    # ================================================================
    def self.run_pipeline(model, path, opts)
      Logger.reset
      config = RecognitionConfig.default

      # ── Force raster: skip all vector parsing, render as image ──
      if opts[:force_raster]
        dpi = opts[:raster_dpi] || 300
        Logger.warn("Pipeline", "Force-raster mode at #{dpi} DPI")
        model.start_operation("Import PDF Raster", true)
        media_box = [0, 0, 612, 792]  # default; overridden per-page below
        import_start = Time.now
        # Try to get actual page size from parser
        begin
          p = PDFParser.new(path)
          p.parse
          if p.page_count > 0
            pg = p.pages.first
            media_box = pg[:media_box] if pg && pg[:media_box]
          end
        rescue => e
          Logger.warn("Pipeline", "Could not read page size: #{e.message}")
        end
        raster_ok = import_page_as_raster(model, path, 1, media_box, opts, import_start)
        if raster_ok
          model.commit_operation
          return { pages: 1, primitives: 0, edges: 0, faces: 0, arcs: 0,
                   text: 0, components: 0, layers: [], cleanup: {},
                   generic: nil, mode_used: nil, xobjects: 0,
                   raster_fallback_used: true }
        else
          model.abort_operation
          UI.messagebox("Force-raster import failed.\n\nMake sure pdftocairo (from Poppler) is installed.")
          return nil
        end
      end

      parser = PDFParser.new(path)
      parser.parse
      if parser.page_count == 0
        # Parser failed (compressed xref, unsupported features, etc.)
        # Try raster fallback before giving up
        if opts[:raster_fallback]
          Logger.warn("Pipeline", "PDF parser found 0 pages — attempting raster fallback")
          model.start_operation("Import PDF Raster", true)
          media_box = [0, 0, 612, 792]  # default letter size
          import_start = Time.now
          raster_ok = import_page_as_raster(model, path, 1, media_box, opts, import_start)
          if raster_ok
            model.commit_operation
            return { pages: 1, primitives: 0, edges: 0, faces: 0, arcs: 0,
                     text: 0, components: 0, layers: [], cleanup: {},
                     generic: nil, mode_used: nil, xobjects: 0,
                     text_mode: :none,
                     elapsed_seconds: (Time.now - import_start).round(1),
                     raster_fallback_used: true }
          else
            model.abort_operation rescue nil
          end
        end
        return nil
      end

      ocg = OCGParser.new(parser)
      ocg.parse

      pages = opts[:pages]
      pages = (1..parser.page_count).to_a if pages == :all
      pages = pages.select { |p| p >= 1 && p <= parser.page_count }
      return nil if pages.empty?

      model.start_operation("Import PDF Vectors", true)

      ocg.layer_list.each do |n|
        t = "PDF::Layer::#{n}"
        model.layers.add(t) unless model.layers[t]
      end

      stats = { pages: 0, primitives: 0, edges: 0, faces: 0, arcs: 0,
                text: 0, components: 0, layers: ocg.layer_list, cleanup: {},
                generic: nil, mode_used: nil, xobjects: 0,
                text_mode: opts[:use_3d_text] ? :geometry : (opts[:import_text] ? :labels : :none) }

      import_start = Time.now

      pages.each_with_index do |page_num, idx|
        pct = pages.length > 1 ? " (#{((idx.to_f / pages.length) * 100).round}%)" : ""
        elapsed = (Time.now - import_start).round(1)

        Sketchup.status_text = "PDF Import#{pct} — Page #{page_num}/#{parser.page_count} — Parsing... [#{elapsed}s]"

        raw = parser.page_data(page_num)
        next unless raw
        media_box = raw[:media_box] || [0, 0, 612, 792]
        streams = raw[:content_streams]
        if streams.nil? || streams.empty?
          # No content streams — try raster fallback instead of skipping
          if opts[:raster_fallback]
            Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — No streams, trying raster... [#{elapsed}s]"
            raster_ok = import_page_as_raster(model, path, page_num, media_box, opts, import_start)
            if raster_ok
              stats[:pages] += 1
              stats[:raster_fallback_used] = true
            end
          end
          next
        end

        Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — Reading paths... [#{elapsed}s]"
        ocg_map = parser.page_ocg_map(page_num)
        cs = ContentStreamParser.new(streams, parser, ocg_map)
        paths = cs.parse
        xobj = XObjectParser.new(parser)
        xobj.scan_page(page_num)
        xobj.count_references(streams)

        text_items = []
        if opts[:import_text]
          Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — Extracting text... [#{(Time.now - import_start).round(1)}s]"
          text_items = ExternalTextExtractor.extract(path, page_num)
          if text_items.nil? || text_items.empty?
            font_maps = parser.page_font_maps(page_num)
            text_items = TextParser.new(streams, font_maps).parse
          end
        end
        if paths.empty? && text_items.empty?
          if opts[:raster_fallback]
            Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — Rendering raster image... [#{(Time.now - import_start).round(1)}s]"
            raster_ok = import_page_as_raster(model, path, page_num, media_box, opts, import_start)
            if raster_ok
              stats[:pages] += 1
              stats[:edges] += 0
            else
              Logger.warn("Pipeline",
                "Page #{page_num}: no vector content and raster render failed; page skipped.")
            end
          end
          next
        end

        Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — #{paths.length} paths, #{text_items.length} text items... [#{(Time.now - import_start).round(1)}s]"

        page_data = PrimitiveExtractor.extract(paths, text_items, media_box, page_num,
          scale: opts[:scale], bezier_segments: opts[:bezier_segments])
        page_data.layers = ocg.layer_list
        page_data.xobject_names = xobj.form_xobjects.keys
        stats[:primitives] += page_data.primitives.length
        stats[:pages] += 1
        stats[:xobjects] += xobj.form_xobjects.length

        recog_mode = opts[:recognition_mode] || :auto
        recognition = nil
        if recog_mode != :none
          Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — Analyzing document... [#{(Time.now - import_start).round(1)}s]"
          recognition = Recognizer.run(page_data, mode: recog_mode, config: config)
          stats[:mode_used] = recognition[:mode_used]
          if recognition[:generic]
            g = recognition[:generic]
            stats[:generic] = {
              circles: g.circles.length, boundaries: g.closed_boundaries.length,
              patterns: g.repeated_patterns.length, tables: g.tables.length,
              title_block: g.title_block_bbox ? true : false,
              dimensions: g.dimension_assocs.length,
              profile: g.page_profile.primary_type }
          end
        end

        Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — Building #{paths.length} paths... [#{(Time.now - import_start).round(1)}s]"

        # ── Hatch detection ──
        hatch_mode = opts[:hatch_mode] || :import
        hatch_paths = []
        if hatch_mode != :import && paths.length > 20
          hatch_indices = HatchDetector.detect(page_data.primitives)
          if hatch_indices && !hatch_indices.empty?
            hatch_set = hatch_indices.to_a
            if hatch_mode == :skip
              paths = paths.each_with_index.reject { |_, i| hatch_set.include?(i) }.map(&:first)
            elsif hatch_mode == :group
              hatch_paths = paths.each_with_index.select { |_, i| hatch_set.include?(i) }.map(&:first)
              paths = paths.each_with_index.reject { |_, i| hatch_set.include?(i) }.map(&:first)
            end
          end
        end

        # When geometry text mode: try pdftocairo first, skip text in builder
        use_svg_text = opts[:use_3d_text] && opts[:import_text]
        builder_text_items = use_svg_text ? [] : text_items

        builder = GeometryBuilder.new(model, paths, builder_text_items, media_box,
          scale_factor: opts[:scale], bezier_segments: opts[:bezier_segments],
          import_as: opts[:import_as], layer_name: opts[:layer_name],
          group_per_page: opts[:group_per_page], page_number: page_num,
          flatten_to_2d: true, merge_tolerance: opts[:merge_tolerance],
          import_fills: opts[:import_fills], group_by_color: opts[:group_by_color],
          detect_arcs: opts[:detect_arcs], map_dashes: opts[:map_dashes],
          import_text: use_svg_text ? false : opts[:import_text],
          use_3d_text: false,  # never use add_3d_text in builder
          y_offset: idx * (media_box[3] - media_box[1]) * opts[:scale] * 1.2)
        result = builder.build
        stats[:edges] += result[:edges]; stats[:faces] += result[:faces]
        stats[:arcs] += result[:arcs]; stats[:text] += result[:text_objects]

        # Build hatching on separate layer if group mode
        if hatch_mode == :group && !hatch_paths.empty? && builder.page_group
          hatch_layer_name = "#{opts[:layer_name] || 'PDF Import'}:Hatching"
          hatch_builder = GeometryBuilder.new(model, hatch_paths, [], media_box,
            scale_factor: opts[:scale], bezier_segments: opts[:bezier_segments],
            import_as: :edges, layer_name: hatch_layer_name,
            group_per_page: false, page_number: page_num,
            flatten_to_2d: true, merge_tolerance: opts[:merge_tolerance],
            import_fills: false, group_by_color: false,
            detect_arcs: false, map_dashes: false,
            import_text: false, use_3d_text: false,
            target_entities: builder.page_group.entities)
          hatch_result = hatch_builder.build
          stats[:edges] += hatch_result[:edges]
          # Default hatching layer to hidden
          begin
            hl = model.layers[hatch_layer_name]
            hl.visible = false if hl
          rescue StandardError => e
            Logger.warn("Main", "hide hatch layer failed: #{e.message}")
          end
        end

        # Render text as precise vector geometry via pdftocairo
        if use_svg_text && builder.page_group
          Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — Rendering text geometry... [#{(Time.now - import_start).round(1)}s]"
          text_layer = model.layers['PDF Import:Text'] ||
                       model.layers.add("#{opts[:layer_name] || 'PDF Import'}:Text")
          svg_result = SvgTextRenderer.render(
            builder.page_group.entities, path, page_num, media_box,
            scale: opts[:scale], layer: text_layer)

          if svg_result
            stats[:text] += svg_result[:glyphs]
            stats[:edges] += svg_result[:edges]
            stats[:text_mode] = :geometry
          else
            # pdftocairo not available — fall back to add_3d_text via builder
            Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — Fallback text rendering... [#{(Time.now - import_start).round(1)}s]"
            Logger.warn("Pipeline", "pdftocairo not found — falling back to add_3d_text")
            fallback_builder = GeometryBuilder.new(model, [], text_items, media_box,
              scale_factor: opts[:scale], layer_name: opts[:layer_name],
              group_per_page: false, page_number: page_num,
              flatten_to_2d: true, import_text: true, use_3d_text: true,
              target_entities: builder.page_group.entities)
            fb_result = fallback_builder.build
            stats[:text] += fb_result[:text_objects]
          end
        end

        if opts[:cleanup_geometry] && builder.page_group
          Sketchup.status_text = "PDF Import#{pct} — Page #{page_num} — Cleaning up geometry... [#{(Time.now - import_start).round(1)}s]"
          cl = GeometryCleanup.cleanup(builder.page_group.entities,
            merge_tolerance: opts[:merge_tolerance], min_edge_length: opts[:merge_tolerance])
          cl.each { |k, v| stats[:cleanup][k] = (stats[:cleanup][k] || 0) + v }
        end
      end

      model.commit_operation
      elapsed = (Time.now - import_start).round(1)
      Sketchup.status_text = "PDF Import complete — #{stats[:edges]} edges, #{stats[:text]} text items — #{elapsed}s"

      stats[:elapsed_seconds] = elapsed

      # ── Auto fit view to geometry (not text) ──
      begin
        view = model.active_view
        if view
          # Temporarily hide text tag so zoom_extents fits geometry only
          text_tag_name = "#{opts[:layer_name] || 'PDF Import'}:Text"
          text_tag = model.layers[text_tag_name]
          was_visible = text_tag ? text_tag.visible? : nil

          text_tag.visible = false if text_tag && was_visible

          # Switch to top-down orthographic view for 2D drawing
          cam = view.camera
          # Find bounding box center of imported geometry
          bb = nil
          model.entities.each do |e|
            next unless e.respond_to?(:bounds) && e.valid?
            if bb
              bb.add(e.bounds)
            else
              bb = e.bounds
            end
          end

          if bb && bb.valid?
            center = bb.center
            eye = Geom::Point3d.new(center.x, center.y, center.z + 1000)
            target = center
            up = Geom::Vector3d.new(0, 1, 0)
            view.camera = Sketchup::Camera.new(eye, target, up)
            view.camera.perspective = false
          end

          view.zoom_extents

          # Restore text tag visibility
          text_tag.visible = true if text_tag && was_visible
        end
      rescue => e
        Logger.warn("Pipeline", "Auto-fit view failed: #{e.message}")
      end

      stats
    end

    # ================================================================
    # RASTER FALLBACK — render scanned page as positioned image
    # ================================================================
    def self.import_page_as_raster(model, pdf_path, page_num, media_box, opts, import_start)
      exe = SvgTextRenderer.find_pdftocairo rescue nil
      return false unless exe

      dpi = opts[:raster_dpi] || 300
      page_w_pts = (media_box[2] - media_box[0]).abs
      page_h_pts = (media_box[3] - media_box[1]).abs
      page_w_pts = 612.0 if page_w_pts < 1
      page_h_pts = 792.0 if page_h_pts < 1

      # Render page to PNG
      png_path = File.join(Dir.tmpdir,
        "bc_raster_#{Process.pid}_#{Time.now.to_i}_p#{page_num}.png")

      args = [exe, '-png', '-r', dpi.to_s,
              '-f', page_num.to_s, '-l', page_num.to_s,
              pdf_path, png_path.sub(/\.png$/, '')]
      ok = system(*args)

      # pdftocairo appends page number to filename
      actual_png = nil
      [png_path,
       png_path.sub(/\.png$/, "-#{page_num}.png"),
       png_path.sub(/\.png$/, "-01.png"),
       png_path.sub(/\.png$/, "-1.png")
      ].each do |candidate|
        if File.exist?(candidate)
          actual_png = candidate
          break
        end
      end

      return false unless actual_png && File.exist?(actual_png)

      begin
        scale = opts[:scale] || 1.0
        # Image size in inches = page pts / 72
        img_w = page_w_pts / 72.0 * scale
        img_h = page_h_pts / 72.0 * scale

        # Place image at origin
        pt = Geom::Point3d.new(0, 0, 0)
        begin
          # add_image available in SketchUp 2017+
          img = model.active_entities.add_image(actual_png, pt, img_w, img_h)
          if img
            layer = model.layers['PDF Import'] || model.layers.add('PDF Import')
            img.layer = layer rescue nil
            Sketchup.status_text = "PDF Import — Page #{page_num} — Raster image placed at #{dpi} DPI [#{(Time.now - import_start).round(1)}s]"
            return true
          end
        rescue => e
          Logger.warn("Raster", "add_image failed: #{e.message}")
        end
      rescue => e
        Logger.warn("Raster", "Failed: #{e.message}")
      ensure
        begin
          File.delete(actual_png) if actual_png && File.exist?(actual_png)
        rescue StandardError => e
          Logger.warn("Main", "cleanup temp png failed: #{e.message}")
        end
      end
      false
    end

    # ================================================================
    # PUBLIC ENTRY POINTS
    # ================================================================
    def self.import_pdf
      model = Sketchup.active_model
      return UI.messagebox("No active model.") unless model
      path = UI.openpanel("Select PDF File", "", "PDF Files|*.pdf||")
      return unless path && File.exist?(path)
      begin
        opts = ImportDialog.show(path)
        return unless opts
        stats = run_pipeline(model, path, opts)
        unless stats
          UI.messagebox("No vector content found in PDF.")
        end
      rescue => e
        model.abort_operation rescue nil
        UI.messagebox("Error:\n#{e.message}\n\n#{e.backtrace.first(5).join("\n")}")
      end
    end

    def self.batch_import
      model = Sketchup.active_model
      return UI.messagebox("No active model.") unless model
      folder = UI.select_directory(title: "Select Folder of PDFs")
      return unless folder && File.directory?(folder)
      pdfs = (Dir.glob(File.join(folder, "*.pdf")) + Dir.glob(File.join(folder, "*.PDF"))).uniq
      return UI.messagebox("No PDF files found.") if pdfs.empty?
      return unless UI.messagebox("Import #{pdfs.length} PDF(s) with Full preset?", MB_YESNO) == IDYES
      ok = 0; fail_c = 0
      preset = ImportDialog::PRESETS['Full']
      pdfs.sort.each_with_index do |pdf, idx|
        Sketchup.status_text = "Batch: #{idx+1}/#{pdfs.length} #{File.basename(pdf)}"
        begin
          opts = ImportDialog.send(:build_opts, preset.merge(pages: 'All'))
          ok += 1 if run_pipeline(model, pdf, opts)
        rescue => e
          fail_c += 1; Logger.error("Batch", File.basename(pdf), e)
        end
      end
      UI.messagebox("Batch: #{ok} imported, #{fail_c} failed, #{pdfs.length} total.")
    end

    def self.scale_by_reference; ScaleTool.activate; end
    def self.quick_scale; ScaleTool.quick_scale; end

    def self.cleanup_selected
      model = Sketchup.active_model; return unless model
      groups = model.selection.grep(Sketchup::Group)
      return UI.messagebox("Select groups to clean.") if groups.empty?
      model.start_operation("Cleanup", true)
      total = {}
      groups.each { |g| GeometryCleanup.cleanup(g.entities).each { |k,v| total[k]=(total[k]||0)+v } }
      model.commit_operation
      UI.messagebox("Cleanup:\n"+total.select{|_,v|v>0}.map{|k,v|"  #{v} #{k}"}.join("\n"))
    end

    def self.feature_inventory
      model = Sketchup.active_model; return unless model
      t = model.selection.grep(Sketchup::Group).first
      UI.messagebox(Metadata.report(t ? t.entities : model.active_entities))
    end

    def self.visibility_toggles; ReportDialog.show_visibility_menu; end

    # ================================================================
    # MENU & TOOLBAR
    # ================================================================
    unless @loaded
      UI.menu('File').add_item('Import PDF Vectors...') { self.import_pdf }

      sub = UI.menu('Plugins').add_submenu('PDF Vector Importer')
      sub.add_item('Import PDF...') { self.import_pdf }
      sub.add_item('Batch Import Folder...') { self.batch_import }
      sub.add_separator
      sub.add_item('Scale to Real Dimensions...') { self.scale_by_reference }
      sub.add_item('Quick Scale...') { self.quick_scale }
      sub.add_separator
      sub.add_item('About') {
        UI.messagebox(
          "PDF Vector Importer v#{PLUGIN_VERSION}\n" \
          "by BlueCollar Systems\n\n" \
          "Import PDF drawings as editable SketchUp geometry.\n\n" \
          "BUILT. NOT BOUGHT.")
      }

      tb = UI::Toolbar.new("PDF Vector Importer")
      [["Import PDF", method(:import_pdf), "Import a PDF drawing"],
       ["Scale", method(:scale_by_reference), "Scale to real dimensions"]
      ].each do |label, action, tip|
        cmd = UI::Command.new(label) { action.call }
        cmd.tooltip = tip; cmd.small_icon = cmd.large_icon = ""
        tb.add_item(cmd)
      end
      tb.show if tb.get_last_state == TB_NEVER_SHOWN

      begin
        Sketchup.register_importer(PDFFileImporter.new)
      rescue => e
        puts "PDF importer registration: #{e.message}" if $VERBOSE
      end

      @loaded = true
    end

    # ================================================================
    # File Importer — drag-drop + File > Import
    # ================================================================
    class PDFFileImporter < Sketchup::Importer
      def description; "PDF Vector Drawings (*.pdf)"; end
      def file_extension; "pdf"; end
      def id; "com.bluecollar.pdfvectorimporter"; end
      def supports_options?; true; end

      def load_file(file_path, status)
        opts = ImportDialog.show(file_path)
        return Sketchup::Importer::ImportCanceled unless opts
        model = Sketchup.active_model
        return Sketchup::Importer::ImportFail unless model
        stats = BlueCollarSystems::PDFVectorImporter.run_pipeline(model, file_path, opts)
        stats ? Sketchup::Importer::ImportSuccess : Sketchup::Importer::ImportFail
      rescue => e
        model.abort_operation rescue nil
        Logger.error("PDFFileImporter", "load_file failed", e)
        Sketchup::Importer::ImportFail
      end
    end

  end
end
