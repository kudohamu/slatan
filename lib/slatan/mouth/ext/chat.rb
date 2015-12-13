require 'slatan/affiliation'
require 'slatan/buttocks'

module Slatan
  module Mouth
    module Ext
      module Chat
        @category = 'chat'

        class << self

          # build postMessage to reply specific user
          # @param user [string] name or id of user
          # @param channel [string] channel id
          # @param text [string] message
          # @param options [hash] options
          #
          # @see https://api.slack.com/methods/chat.postMessage
          def reply(user, channel, text, options={})
            user = user.to_s if user.kind_of?(Symbol)
            user_id = Affiliation::Users.is_id?(user) ? user : Affiliation::Users.get_id(user)
            if user_id.nil?
              Buttocks.error("user '#{user}' is not exist. (reply_message)")
              return
            end
            reply_text = "<@#{user_id}>: #{text}"
            send('postMessage', {
              channel: channel,
              text: reply_text
            }.merge(options))
          end

          # build postMessage to reply specific multiple users
          # @param users [array] name or id of users
          # @param channel [string] channel id
          # @param text [string] message
          # @param options [hash] options
          #
          # @see https://api.slack.com/methods/chat.postMessage
          def mreply(users, channel, text, options={})
            user_ids = users.map do |user|
              user = user.to_s if user.kind_of?(Symbol)
              user_id = Affiliation::Users.is_id?(user) ? user : Affiliation::Users.get_id(user)
              if user_id.nil?
                Buttocks.error("user '#{user}' is not exist. (reply_message)")
              end
              user_id
            end
            user_ids = user_ids.compact.uniq
            users_list = user_ids.reduce("") do |list, user_id|
              "<@#{user_id}>: #{list}"
            end
            reply_text = "#{users_list}#{text}"
            send('postMessage', {
              channel: channel,
              text: reply_text
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
end
