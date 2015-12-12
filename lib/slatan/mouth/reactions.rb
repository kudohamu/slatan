module Slatan
  module Mouth
    module Reactions
      @category = 'reactions'

      class << self
        ## @see https://api.slack.com/methods/reactions.add
        def add(name, options={})
          send('add', {
            name: name
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/reactions.get
        def get(options={})
          send('get', options)
        end

        ## @see https://api.slack.com/methods/reactions.list
        def list(options={})
          send('list', options)
        end

        ## @see https://api.slack.com/methods/reactions.remove
        def remove(name, options={})
          send('remove', {
            name: name
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
