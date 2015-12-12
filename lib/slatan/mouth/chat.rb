module Slatan
  module Mouth
    module Chat
      @category = 'chat'

      class << self
        ## @see https://api.slack.com/methods/chat.postMessage
        def post_message(text, options={})
          send('postMessage', {
            text: text
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/chat.update
        def update(text, ts, options={})
          send('update', {
            text: text,
            ts: ts
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/chat.delete
        def delete(ts, options={})
          send('delete', {
            ts: ts
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
