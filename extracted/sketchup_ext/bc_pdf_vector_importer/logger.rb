# bc_pdf_vector_importer/logger.rb
# Centralized logging — replaces bare rescue blocks.
# Copyright 2024-2026 BlueCollar Systems — BUILT. NOT BOUGHT.

require 'tmpdir'

module BlueCollarSystems
  module PDFVectorImporter
    module Logger
      @warnings = []
      @errors = []
      @debug = false
      @log_file = nil

      def self.debug=(val); @debug = val; end
      def self.debug?; @debug; end

      def self.reset
        @warnings = []
        @errors = []
        # Open a log file in the system temp directory for post-session diagnosis.
        # Previous log is overwritten each import so it stays small.
        begin
          dir = File.join(Dir.tmpdir, 'bc_pdf_importer')
          Dir.mkdir(dir) unless Dir.exist?(dir)
          @log_file = File.open(File.join(dir, 'last_import.log'), 'w')
          @log_file.puts "--- PDF Vector Importer log #{Time.now.strftime('%Y-%m-%d %H:%M:%S')} ---"
        rescue StandardError
          @log_file = nil
        end
      end

      def self.warn(context, msg)
        entry = "[WARN] #{context}: #{msg}"
        @warnings << entry
        puts entry if @debug
        @log_file.puts(entry) if @log_file
      end

      def self.error(context, msg, exception = nil)
        entry = "[ERR] #{context}: #{msg}"
        entry += " (#{exception.class}: #{exception.message})" if exception
        @errors << entry
        puts entry if @debug
        @log_file.puts(entry) if @log_file
        if exception && exception.backtrace
          bt = "  " + exception.backtrace.first(3).join("\n  ")
          puts bt if @debug
          @log_file.puts(bt) if @log_file
        end
      end

      def self.info(context, msg)
        entry = "[INFO] #{context}: #{msg}"
        puts entry if @debug
        @log_file.puts(entry) if @log_file
      end

      def self.flush_log
        @log_file.flush if @log_file
      rescue StandardError
        # ignore flush errors
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

      # Returns the path to the log file (for user diagnosis)
      def self.log_path
        @log_file ? @log_file.path : nil
      end
    end
  end
end
