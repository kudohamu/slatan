module Slatan
  module Mouth
    module Pins
      @category = 'pins'

      class << self
        ## @see https://api.slack.com/methods/pins.add
        def add(channel, options={})
          send('add', {
            channel: channel
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/pins.remove
        def remove(channel, options={})
          send('remove', {
            channel: channel
          }.merge(options))
        end

        private
        def send(method, msg)
          Mouth.send(@category, method, msg)
        end
      end
    end
  end
end
