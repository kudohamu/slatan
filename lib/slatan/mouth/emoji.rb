module Slatan
  module Mouth
    module Emoji
      @category = 'emoji'

      class << self
        ## @see https://api.slack.com/methods/emoji.list
        def list(options={})
          send('list', options)
        end

        private
        def send(method, msg)
          Mouth.send(@category, method, msg)
        end
      end
    end
  end
end
