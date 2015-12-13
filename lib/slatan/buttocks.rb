require 'slatan/spirit'
require 'logger'

module Slatan
  ## Wrapper class of Logger
  class Buttocks
    @@use_log = Spirit.use_log

    @@color = {
      reset: 0,
      fatal: 31,  #red
      error: 31,  #red
      warn:  33,  #yellow
      info:  32,  #green
      debug: 37   #white
    }

    class << self
      def init()
        if @@use_log
          path = Spirit.log_file_path
          @@log = Logger.new(path)

          @@log.level = const_level(Spirit.log_level)
        end
      end

      def debug(msg)
        @@log.debug(msg) if @@use_log
        stdoutput('debug', msg)
      end

      def info(msg)
        @@log.info(msg) if @@use_log
        stdoutput('info', msg)
      end

      def warn(msg)
        @@log.warn(msg) if @@use_log
        stdoutput('warn', msg)
      end

      def error(msg)
        @@log.error(msg) if @@use_log
        stdoutput('error', msg)
      end

      def fatal(msg)
        @@log.fatal(msg) if @@use_log
        stdoutput('fatal', msg)
      end

      private
      def const_level(level)
        case level
        when 'debug'
          Logger::DEBUG
        when 'info'
          Logger::INFO
        when 'warn'
          Logger::WARN
        when 'error'
          Logger::ERROR
        else
          Logger::FATAL
        end
      end

      def stdoutput(level, msg)
        puts "\e[#{@@color[level.to_sym]}m[#{level}] #{DateTime.now.strftime('%Y-%m-%d %H:%M:%S')}: #{msg}"
        print "\e[#{@@color[:reset]}m"
      end
    end
  end
end
