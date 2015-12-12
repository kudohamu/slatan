module Slatan
  module Mouth
    module Im
      @category = 'im'

      class << self
        ## @see https://api.slack.com/methods/im.close
        def close(options={})
          send('close', options)
        end

        ## @see https://api.slack.com/methods/im.history
        def history(options={})
          send('history', options)
        end

        ## @see https://api.slack.com/methods/im.list
        def list(options={})
          send('list', options)
        end

        ## @see https://api.slack.com/methods/im.mark
        def mark(ts, options={})
          send('mark', {
            ts: ts
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/im.open
        def open(user, options={})
          send('open', {
            user: user
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
