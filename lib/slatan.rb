require "slatan/version"
require "slatan/spirit"
require "slatan/heart"
require "slatan/ear"
require "slatan/buttocks"

module Slatan

  class << self
    def run
      Buttocks.init

      @heart = Heart.new
      @ear   = Ear.new

      begin
        @heart.beat @ear
      rescue => e
        Buttocks.fatal "#{e.backtrace.first}: #{e.message} (#{e.class})"
      end
    end
  end
end
