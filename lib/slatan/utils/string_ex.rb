module Slatan
  module Utils
    module StringEx
      refine String do
        def camelize
          self.split('_').map(&:capitalize).join
        end
      end
    end
  end
end
