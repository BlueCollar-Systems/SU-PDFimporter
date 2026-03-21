# bc_pdf_vector_importer.rb
# Root loader for the PDF Vector Importer SketchUp Extension
# Compatible with SketchUp 2017 Make (Ruby 2.2) through current Pro versions.
#
# Copyright 2024-2026 BlueCollar Systems
# License: MIT
# BUILT. NOT BOUGHT.
#
# AI Contributors: Claude & Claude Code (Anthropic), ChatGPT & Codex (OpenAI),
#   Gemini (Google), Microsoft Copilot — collaborative AI development partners.

require 'sketchup.rb'
require 'extensions.rb'

module BlueCollarSystems
  module PDFVectorImporter

    PLUGIN_ID       = 'bc_pdf_vector_importer'.freeze
    PLUGIN_NAME     = 'PDF Vector Importer'.freeze
    PLUGIN_VERSION  = '3.5.0'.freeze
    PLUGIN_DIR      = File.join(File.dirname(__FILE__), PLUGIN_ID).freeze

    extension = SketchupExtension.new(PLUGIN_NAME, File.join(PLUGIN_ID, 'main'))
    extension.creator     = 'BlueCollar Systems'
    extension.description = 'Import PDF vector geometry as native editable SketchUp edges. ' \
                            'Features arc reconstruction, color-based tag grouping, ' \
                            'text import, dash patterns, Scale by Reference tool, ' \
                            'scanned-page detection warnings, and full Bezier support. ' \
                            'Compatible: SketchUp 2017 Make through current Pro.'
    extension.version     = PLUGIN_VERSION
    extension.copyright   = '2024-2026 BlueCollar Systems'

    Sketchup.register_extension(extension, true)

  end
end
