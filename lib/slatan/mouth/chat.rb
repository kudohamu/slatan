module Slatan
  module Mouth
    module Chat
      @category = 'chat'

      class << self
        ## @see https://api.slack.com/methods/chat.postMessage
        def post_message(channel, text, options={})
          send('postMessage', {
            channel: channel,
            text: text
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/chat.update
        def update(ts, channel, text, options={})
          send('update', {
            ts: ts,
            channel: channel,
            text: text
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/chat.delete
        def delete(channel, ts, options={})
          send('delete', {
            ts: ts,
            channel: channel
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
