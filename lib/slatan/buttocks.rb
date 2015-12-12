require 'slatan/spirit'
require 'logger'

module Slatan
  ## Wrapper class of Logger
  class Buttocks
    @@use_log = Spirit.use_log
    class << self
      def init()
        if @@use_log
          path = Spirit.logfile_path
          @@log = Logger.new(path)

          @@log.level = (case Spirit.log_level
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
        @@log.debug(msg) if @@use_log
      end

      def info(msg)
        @@log.info(msg) if @@use_log
      end

      def warn(msg)
        @@log.warn(msg) if @@use_log
      end

      def error(msg)
        @@log.error(msg) if @@use_log
      end

      def fatal(msg)
        @@log.fatal(msg) if @@use_log
      end
    end
  end
end
