module Slatan
  module Affiliation
    module Self
      @self = {}

      class << self
        def get()
          @self
        end

        def set(celf)
          @self = celf
        end
      end
    end
  end
end
