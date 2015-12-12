module Slatan
  module Mouth
    module Pins
      @category = 'pins'

      class << self
        ## @see https://api.slack.com/methods/pins.add
        def add(options={})
          send('add', options)
        end

        ## @see https://api.slack.com/methods/pins.remove
        def remove(options={})
          send('remove', options)
        end

        private
        def send(method, msg)
          Mouth.send(@category, method, msg)
        end
      end
    end
  end
end
