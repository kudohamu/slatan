module Slatan
  module Mouth
    module Channels
      @category = 'channels'

      class << self
        ## @see https://api.slack.com/methods/channels.history
        def history(channel, options={})
          send('history', {
            channel: channel
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/channels.info
        def info(channel, options={})
          send('info', {
            channel: channel
          }.merge(options))
        end
        
        ## @see https://api.slack.com/methods/channels.list
        def list(options={})
          send('list', options)
        end

        ## @see https://api.slack.com/methods/channels.mark
        def mark(channel, ts, options={})
          send('mark', {
            channel: channel,
            ts: ts
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/channels.setPurpose
        def set_purpose(channel, purpose, options={})
          send('setPurpose', {
            channel: channel,
            purpose: purpose
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/channels.setTopic
        def set_topic(channel, topic, options={})
          send('setTopic', {
            channel: channel,
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
