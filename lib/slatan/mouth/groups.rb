module Slatan
  module Mouth
    module Groups
      @category = 'groups'

      class << self
        ## @see https://api.slack.com/methods/groups.close
        def close(channel, options={})
          send('close', {
            channel: channel
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/groups.history
        def history(channel, options={})
          send('history', {
            channel: channel
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/groups.info
        def info(channel, options={})
          send('info', {
            channel: channel
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/groups.list
        def list(options={})
          send('list', options)
        end

        ## @see https://api.slack.com/methods/groups.mark
        def mark(channel, ts, options={})
          send('mark', {
            channel: channel,
            ts: ts
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/groups.open
        def open(channel, options={})
          send('open', {
            channel: channel
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/groups.setPurpose
        def set_purpose(channel, purpose, options={})
          send('setPurpose', {
            channel: channel,
            purpose: purpose
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/groups.setTopic
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
