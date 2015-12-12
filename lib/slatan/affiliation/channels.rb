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
      end
    end
  end
end
