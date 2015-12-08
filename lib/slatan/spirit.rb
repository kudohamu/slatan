require 'json'

module Botan
  class Spirit
    @@config_path = '../../../config.json'
    @@config = {}

    class << self
      def infuse
        config_file = File.open(File.expand_path(@@config_path, __FILE__), 'r')
        @@config = JSON.parse(config_file.read, {symbolize_names: true})
        config_file.close
      end

      def see()
        @@config
      end
    end
  end
end
