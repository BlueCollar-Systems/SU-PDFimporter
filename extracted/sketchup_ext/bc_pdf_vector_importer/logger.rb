# bc_pdf_vector_importer/logger.rb
# Centralized logging — replaces bare rescue blocks.
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

module BlueCollarSystems
  module PDFVectorImporter
    module Logger
      @warnings = []
      @errors = []
      @debug = false

      def self.debug=(val); @debug = val; end
      def self.debug?; @debug; end

      def self.reset
        @warnings = []
        @errors = []
      end

      def self.warn(context, msg)
        entry = "[WARN] #{context}: #{msg}"
        @warnings << entry
        puts entry if @debug
      end

      def self.error(context, msg, exception = nil)
        entry = "[ERR] #{context}: #{msg}"
        entry += " (#{exception.class}: #{exception.message})" if exception
        @errors << entry
        puts entry if @debug
        if @debug && exception && exception.backtrace
          puts "  " + exception.backtrace.first(3).join("\n  ")
        end
      end

      def self.warnings; @warnings.dup; end
      def self.errors; @errors.dup; end
      def self.warning_count; @warnings.length; end
      def self.error_count; @errors.length; end

      def self.summary
        lines = []
        lines << "#{@warnings.length} warnings, #{@errors.length} errors"
        @errors.first(5).each { |e| lines << "  #{e}" }
        @warnings.first(5).each { |w| lines << "  #{w}" }
        lines.join("\n")
      end
    end
  end
end
