module Slatan
  module Mouth
    module Team
      @category = 'team'

      class << self
        ## @see https://api.slack.com/methods/team.info
        def info(options={})
          send('info', options)
        end

        private
        def send(method, msg)
          Mouth.send(@category, method, msg)
        end
      end
    end
  end
end
