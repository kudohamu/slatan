require 'slatan/spirit'
require 'slatan/mouth/api'
require 'slatan/mouth/auth'
require 'slatan/mouth/channels'
require 'slatan/mouth/chat'
require 'slatan/mouth/emoji'
require 'slatan/mouth/files'
require 'slatan/mouth/groups'
require 'slatan/mouth/im'
require 'slatan/mouth/mpim'
require 'slatan/mouth/pins'
require 'slatan/mouth/reactions'
require 'slatan/mouth/rtm'
require 'slatan/mouth/stars'
require 'slatan/mouth/team'
require 'slatan/mouth/users'
require 'slatan/mouth/ext'
require 'slatan/buttocks'

require 'net/http'
require 'active_support/core_ext/object/try'
require 'json'

module Slatan
  ## send and receive message to use Slack API
  module Mouth
    include Api
    include Auth
    include Channels
    include Chat
    include Emoji
    include Files
    include Groups
    include Im
    include Mpim
    include Pins
    include Reactions
    include Rtm
    include Stars
    include Team
    include Users
    include Ext

    class << self
      def send(category, method, msg)
        base_url = Spirit.slack_api_url

        msg = {
          as_user: true,
          token: Spirit.slack_token
        }.merge(msg)

        uri = URI.parse("#{base_url}/#{category}.#{method}?#{URI.encode_www_form(msg)}")

        Buttocks.debug("sent request: #{uri.request_uri}")

        request = Net::HTTP::Post.new(uri.request_uri, {
          'Content-Type' =>'application/json'
        })
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        response = http.start do |h|
          h.request(request)
        end

        body = JSON.parse(response.try(:body) || '{"ok":false, "error": " request body is empty."}', symbolize_names: true)
        Buttocks.debug("received response: #{body}")
        body
      end
    end
  end
end
