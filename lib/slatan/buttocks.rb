require 'slatan/spirit'
require 'logger'

module Slatan
  class Buttocks
    @@using_log = false
    class << self
      def init()
        path = Spirit.see[:logfile_path]
        if path
          @@log = Logger.new(path)
          @@using_log = true

          @@log.level = (case Spirit.see[:log_level]
          when 'debug'
            Logger::DEBUG
          when 'info'
            Logger::INFO
          when 'warn'
            Logger::WARN
          when 'error'
            Logger::ERROR
          when 'fatal'
            Logger::FATAL
          end)
        end
      end

      def debug(msg)
        @@log.debug(msg) if @@using_log
      end

      def info(msg)
        @@log.info(msg) if @@using_log
      end

      def warn(msg)
        @@log.warn(msg) if @@using_log
      end

      def error(msg)
        @@log.error(msg) if @@using_log
      end

      def fatal(msg)
        @@log.fatal(msg) if @@using_log
      end
    end
  end
end
