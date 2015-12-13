module Slatan
  module Mouth
    module Mpim
      @category = 'mpim'

      class << self
        ## @see https://api.slack.com/methods/mpim.close
        def close(channel, options={})
          send('close', {
            channel: channel
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/mpim.list
        def list(options={})
          send('list', options)
        end

        ## @see https://api.slack.com/methods/mpim.mark
        def mark(channel, ts, options={})
          send('mark', {
            channel: channel,
            ts: ts
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/mpim.open
        # @param users array: array of user
        def open(users, options={})
          send('open', {
            users: users.join(',')
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
