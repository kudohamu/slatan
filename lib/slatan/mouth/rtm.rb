module Slatan
  module Mouth
    module Rtm
      @category = 'rtm'

      class << self
        ## @see https://api.slack.com/methods/rtm.start
        def start(options={})
          send('start', options)
        end

        private
        def send(method, msg)
          Mouth.send(@category, method, msg)
        end
      end
    end
  end
end
