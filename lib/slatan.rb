require "slatan/version"
require "slatan/spirit"
require "slatan/heart"
require "slatan/ear"
require "slatan/buttocks"

module Slatan
  class << self
    ## running slatan
    # @param options
    #         daemonize: running on daemon mode(default false)
    def run(options = {})
      {
        daemonize: false
      }.merge(options)

      Buttocks.init

      @heart = Heart.new

      begin
        daemonize if options[:daemonize]
        @heart.beat
      rescue => e
        Buttocks.fatal "#{e.backtrace.first}: #{e.message} (#{e.class})"
      end
    end

    def daemonize
      begin
        Process.daemon

        File.open(Spirit.pid_file_path, 'w') do |f|
          f << Process.pid
        end
      rescue => e
        Buttocks.fatal "failed to daemonize slatan.(#{e.message})"
        exit
      end
    end
  end
end
