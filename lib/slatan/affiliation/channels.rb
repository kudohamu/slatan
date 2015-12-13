module Slatan
  module Affiliation
    module Channels
      @channels = {}

      class << self
        def get()
          @channels
        end

        def set(channels)
          @channels = channels
        end

        ## return id of channel name
        # @param name: channel name
        def get_id(name)
          @channels.each do |channel|
            return channel[:id] if channel[:name] == name
          end
          nil
        end

        ## return name of channel id
        # @param id: channel id
        def get_name(id)
          @channels.each do |channel|
            return channel[:name] if channel[:id] == id
          end
          nil
        end

      end
    end
  end
end
