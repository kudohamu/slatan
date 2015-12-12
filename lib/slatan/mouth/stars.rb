module Slatan
  module Mouth
    module Stars
      @category = 'stars'

      class << self
        ## @see https://api.slack.com/methods/stars.add
        def add(options={})
          send('add', options)
        end

        ## @see https://api.slack.com/methods/stars.remove
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
