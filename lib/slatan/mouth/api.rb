module Slatan
  module Mouth
    module Api
      @category = 'api'

      class << self
        ## @see https://api.slack.com/methods/api.test
        def test(options={})
          send('test', options)
        end

        private
        def send(method, msg)
          Mouth.send(@category, method, msg)
        end
      end
    end
  end
end
