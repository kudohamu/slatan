module Slatan
  module Mouth
    module Dnd
      @category = 'dnd'

      class << self
        ## @see https://api.slack.com/methods/dnd.endDnd
        def end_dnd(options={})
          send('endDnd', options)
        end

        ## @see https://api.slack.com/methods/dnd.endSnooze
        def end_snooze(options={})
          send('endSnooze', options)
        end

        ## @see https://api.slack.com/methods/dnd.info
        def info(options={})
          send('info', {
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/dnd.setSnooze
        def set_snooze(num_minutes, options)
          send('setSnooze', {
            num_minutes: num_minutes
          }.merge(options))
        end

        ## @see https://api.slack.com/methods/dnd.teamInfo
        def team_info(options={})
          send('teamInfo', {
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
