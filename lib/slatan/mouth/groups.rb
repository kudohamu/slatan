module Slatan
  module Mouth
    module Groups
      @category = 'groups'

      class << self
        ## @see https://api.slack.com/methods/groups.close
        def close(options={})
          send('close', options)
        end

        ## @see https://api.slack.com/methods/groups.history
        def history(options={})
          send('history', options)
        end

        ## @see https://api.slack.com/methods/groups.info
        def info(options={})
          send('info', options)
        end

        ## @see https://api.slack.com/methods/groups.list
        def list(options={})
          send('list', options)
        end

        ## @see https://api.slack.com/methods/groups.mark
        def mark(ts, options={})
          send('mark', {
            ts: ts
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/groups.open
        def open(options={})
          send('open', options)
        end

        ## @see https://api.slack.com/methods/groups.setPurpose
        def set_purpose(purpose, options={})
          send('setPurpose', {
            purpose: purpose
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/groups.setTopic
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
