module Slatan
  module Mouth
    module Users
      @category = 'users'

      class << self
        ## @see https://api.slack.com/methods/users.info
        def info(user, options={})
          send('info', {
            user: user
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/users.list
        def list(options={})
          send('list', options)
        end

        ## @see https://api.slack.com/methods/users.getPresence
        def get_presence(user, options={})
          send('getPresence', {
            user: user
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/users.setPresence
        def set_presence(presence, options={})
          send('setPresence', {
            presence: presence
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
