module Slatan
  module Mouth
    module Channels
      @category = 'channels'

      class << self
        ## @see https://api.slack.com/methods/channels.history
        def history(options={})
          send('history', options)
        end

        ## @see https://api.slack.com/methods/channels.info
        def info(options={})
          send('info', options)
        end

        ## @see https://api.slack.com/methods/channels.mark
        def mark(ts, options={})
          send('mark', {
            ts: ts
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/channels.setPurpose
        def set_purpose(purpose, options={})
          send('setPurpose', {
            purpose: purpose
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/channels.setTopic
        def set_topic(topic, options={})
          send('setTopic', {
            topic: topic
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
