require "util/string_ex"

module Slatan
  using StringEx

  class Ear
    def initialize(mouth)
      @concerns = []
      Dir[File.expand_path('../../../concerns', __FILE__) << '/*.rb'].each do |file|
        require file
        @concerns << Object.const_get(File.basename(file, '.*').camelize).new(mouth)
      end
    end

    def hear(msg)
      @concerns.each do |concern|
        concern.hear(msg)
      end
    end
  end
end
