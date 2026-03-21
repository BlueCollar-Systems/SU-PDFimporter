# bc_pdf_vector_importer/import_dialog.rb
# Import dialog v3 — Basic/Advanced modes, preset profiles,
# plain-English labels, guided defaults.
#
# Copyright 2024 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module ImportDialog

      # ── Preset profiles ──────────────────────────────────────────
      PRESETS = {
        'Fast' => {
          scale: '1.0', bezier_segments: '8', import_as: 'Edges Only',
          import_fills: 'No', group_by_color: 'No', detect_arcs: 'No',
          map_dashes: 'No', text_mode: 'No text', hatch_mode: 'Skip',
          cleanup_geometry: 'No', recognition_mode: 'None',
          merge_tolerance: '0.005', units: 'Inches',
          force_raster: 'No', raster_dpi: '300'
        },
        'Full' => {
          scale: '1.0', bezier_segments: '24', import_as: 'Edges and Faces',
          import_fills: 'Yes', group_by_color: 'Yes', detect_arcs: 'Yes',
          map_dashes: 'Yes', text_mode: 'Geometry', hatch_mode: 'Group',
          cleanup_geometry: 'Yes', recognition_mode: 'None',
          merge_tolerance: '0.001', units: 'Inches',
          force_raster: 'No', raster_dpi: '300'
        },
        'Raster Image' => {
          scale: '1.0', bezier_segments: '8', import_as: 'Edges Only',
          import_fills: 'No', group_by_color: 'No', detect_arcs: 'No',
          map_dashes: 'No', text_mode: 'No text', hatch_mode: 'Skip',
          cleanup_geometry: 'No', recognition_mode: 'None',
          merge_tolerance: '0.005', units: 'Inches',
          force_raster: 'Yes', raster_dpi: '300'
        },
        'Custom...' => nil
      }.freeze

      YES_NO = 'Yes|No'
      PRESET_NAMES = PRESETS.keys.join('|')

      TEXT_MODES = 'Labels|Geometry|No text'
      HATCH_MODES = 'Import|Group|Skip'

      # ---------------------------------------------------------------
      # Main entry point — shows Basic dialog first.
      # Returns options hash or nil (cancelled).
      # ---------------------------------------------------------------
      def self.show(filepath)
        filename = File.basename(filepath)
        saved = load_prefs

        # ── Step 1: Basic dialog ──
        prompts = [
          "Preset:",
          "Pages (1, 1-5, or All):",
          "Scale Factor:",
          "Import Text:"
        ]

        last_preset = saved[:last_preset] || 'Full'
        defaults = [
          last_preset,
          saved[:pages] || 'All',
          saved[:scale] || '1.0',
          saved[:text_mode] || 'Labels'
        ]

        dropdowns = [
          PRESET_NAMES,
          '',
          '',
          TEXT_MODES
        ]

        result = UI.inputbox(prompts, defaults, dropdowns,
                             "Import PDF — #{filename}")
        return nil unless result

        preset_name, pages_str, scale_str, text_mode_str = result

        # Save last choices
        save_prefs(last_preset: preset_name, pages: pages_str,
                   scale: scale_str, text_mode: text_mode_str)

        # ── If "Custom..." → show full dialog ──
        if preset_name == 'Custom...'
          return show_advanced(filepath, pages_str, scale_str, nil, text_mode_str)
        end

        # ── Build opts from preset + overrides ──
        preset = PRESETS[preset_name] || PRESETS['Full']

        opts = build_opts(
          preset.merge(
            pages: pages_str,
            scale: scale_str,
            text_mode: text_mode_str
          )
        )

        opts
      end

      # ---------------------------------------------------------------
      # Advanced dialog — all settings exposed
      # ---------------------------------------------------------------
      def self.show_advanced(filepath, pages_str, scale_str, recog_str, text_mode_str)
        filename = File.basename(filepath)
        saved = load_prefs

        prompts = [
          "Pages:",
          "Scale Factor:",
          "Curve Smoothness (4=fast, 48=smooth):",
          "Import Text:",
          "Hatchings:",
          "Rebuild Arcs from Curves:",
          "Map Dashed/Hidden Lines:",
          "Import Filled Regions:",
          "Auto-Clean Geometry:",
          "Force Raster Image (skip vectors):",
          "Raster DPI (150-600):"
        ]

        defaults = [
          pages_str || saved[:pages] || 'All',
          scale_str || saved[:scale] || '1.0',
          saved[:bezier_segments] || '24',
          text_mode_str || saved[:text_mode] || 'Geometry',
          saved[:hatch_mode] || 'Group',
          saved[:detect_arcs] || 'Yes',
          saved[:map_dashes] || 'Yes',
          saved[:import_fills] || 'Yes',
          saved[:cleanup_geometry] || 'Yes',
          saved[:force_raster] || 'No',
          saved[:raster_dpi] || '300'
        ]

        dropdowns = [
          '', '', '',
          TEXT_MODES,
          HATCH_MODES,
          YES_NO, YES_NO, YES_NO, YES_NO,
          YES_NO, ''
        ]

        result = UI.inputbox(prompts, defaults, dropdowns,
                             "Custom Import — #{filename}")
        return nil unless result

        p_pages, p_scale, p_bezier, p_text_mode, p_hatch,
        p_arcs, p_dashes, p_fills, p_cleanup,
        p_force_raster, p_raster_dpi = result

        save_prefs(
          pages: p_pages, scale: p_scale, bezier_segments: p_bezier,
          text_mode: p_text_mode, hatch_mode: p_hatch,
          detect_arcs: p_arcs, map_dashes: p_dashes,
          import_fills: p_fills, cleanup_geometry: p_cleanup,
          force_raster: p_force_raster, raster_dpi: p_raster_dpi,
          last_preset: 'Custom...'
        )

        import_as = p_fills == 'Yes' ? 'Edges and Faces' : 'Edges Only'

        build_opts(
          pages: p_pages, scale: p_scale, bezier_segments: p_bezier,
          import_as: import_as, layer_name: 'PDF Import',
          group_per_page: 'Yes', import_fills: p_fills,
          group_by_color: 'Yes', detect_arcs: p_arcs,
          map_dashes: p_dashes, text_mode: p_text_mode,
          hatch_mode: p_hatch,
          raster_fallback: 'Yes', cleanup_geometry: p_cleanup,
          force_raster: p_force_raster, raster_dpi: p_raster_dpi,
          recognition_mode: 'None', merge_tolerance: '0.001',
          units: 'Inches'
        )
      end

      private

      # ---------------------------------------------------------------
      # Build normalized options hash from raw dialog values
      # ---------------------------------------------------------------
      def self.build_opts(raw)
        # Scale
        scale = (raw[:scale] || '1.0').to_f
        scale = 1.0 if scale <= 0

        case (raw[:units] || '')
        when /Feet/i then scale *= 12.0
        when /Points/i then scale *= 72.0
        end

        # Pages
        pages_str = (raw[:pages] || 'All').strip
        if pages_str.downcase == 'all' || pages_str.empty?
          pages = :all
        else
          pages = []
          pages_str.split(/[,;\s]+/).each do |part|
            if part =~ /\A(\d+)\s*-\s*(\d+)\z/
              ($1.to_i..$2.to_i).each { |p| pages << p }
            else
              p = part.to_i
              pages << p if p > 0
            end
          end
          pages = pages.uniq.sort
          pages = :all if pages.empty?
        end

        # Bezier
        bezier = (raw[:bezier_segments] || '16').to_i
        bezier = [[bezier, 4].max, 64].min

        # Import mode
        import_mode = case (raw[:import_as] || '')
                      when /Faces Only/i then :faces
                      when /Edges and Faces/i then :both
                      else :edges
                      end

        # Recognition mode
        recog = case (raw[:recognition_mode] || '')
                when /None/i then :none
                when /Generic/i then :generic
                else :auto
                end

        # Text mode
        text_mode = (raw[:text_mode] || 'Labels').to_s
        import_text = (text_mode =~ /No text/i) ? false : true
        use_3d_text = (text_mode =~ /Geometry/i) ? true : false

        # Hatch mode
        hatch = case (raw[:hatch_mode] || 'Group')
                when /Skip/i then :skip
                when /Group/i then :group
                else :import
                end

        {
          scale:            scale,
          pages:            pages,
          bezier_segments:  bezier,
          import_as:        import_mode,
          layer_name:       (raw[:layer_name] || 'PDF Import').to_s.strip,
          group_per_page:   (raw[:group_per_page] || 'Yes') == 'Yes',
          flatten_to_2d:    true,
          merge_tolerance:  (raw[:merge_tolerance] || '0.001').to_f.abs,
          import_fills:     (raw[:import_fills] || 'Yes') == 'Yes',
          group_by_color:   (raw[:group_by_color] || 'Yes') == 'Yes',
          detect_arcs:      (raw[:detect_arcs] || 'Yes') == 'Yes',
          map_dashes:       (raw[:map_dashes] || 'Yes') == 'Yes',
          import_text:      import_text,
          use_3d_text:      use_3d_text,
          hatch_mode:       hatch,
          raster_fallback:  (raw[:raster_fallback] || 'Yes') == 'Yes',
          force_raster:     (raw[:force_raster] || 'No') == 'Yes',
          raster_dpi:       [[((raw[:raster_dpi] || '300').to_i), 150].max, 600].min,
          cleanup_geometry: (raw[:cleanup_geometry] || 'Yes') == 'Yes',
          recognition_mode: recog
        }
      end

      # ---------------------------------------------------------------
      # Preferences
      # ---------------------------------------------------------------
      PREF_KEY = 'BlueCollarSystems_PDFVectorImporter'.freeze

      def self.load_prefs
        prefs = {}
        begin
          %w[last_preset pages scale bezier_segments import_as layer_name
             group_per_page import_fills group_by_color detect_arcs
             map_dashes text_mode hatch_mode raster_fallback force_raster
             raster_dpi cleanup_geometry recognition_mode merge_tolerance
             units
          ].each do |key|
            val = Sketchup.read_default(PREF_KEY, key, nil)
            prefs[key.to_sym] = val if val
          end
        rescue StandardError => e
          Logger.warn("ImportDialog", "load_prefs failed: #{e.message}")
        end
        prefs
      end

      def self.save_prefs(hash)
        begin
          hash.each { |key, val| Sketchup.write_default(PREF_KEY, key.to_s, val.to_s) }
        rescue StandardError => e
          Logger.warn("ImportDialog", "save_prefs failed: #{e.message}")
        end
      end

    end
  end
end
