module Slatan
  module Mouth
    module Auth
      @category = 'auth'

      class << self
        ## @see https://api.slack.com/methods/auth.test
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
