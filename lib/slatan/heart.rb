require 'slatan/spirit'
require 'slatan/buttocks'
require 'slatan/affiliation'

require 'faye/websocket'
require 'eventmachine'
require 'json'

module Slatan
  class Heart
    def beat()
      Signal.trap(:INT)  { EM.stop }
      Signal.trap(:TERM) { EM.stop }

      req = Net::HTTP.post_form URI("#{Spirit.slack_api_url}/rtm.start"), token: Spirit.slack_token
      parsed_body = JSON.parse(req.body, symbolize_names: true)
      Buttocks.fatal "failed rtm.start (#{parsed_body[:error]})" if !parsed_body[:ok]
      set_affiliation parsed_body
      ws_url = parsed_body[:url]
      EM.run {
        @ws = Faye::WebSocket::Client.new(ws_url)

        @ws.on :open do |event|
          Buttocks.info('open')
        end

        @ws.on :message do |event|
          Buttocks.debug("message: #{event.data}")
          data = JSON.parse(event.data, symbolize_names: true)
          Ear.hear(data) if enable_dispatch data
        end

        @ws.on :close do |event|
          Buttocks.warn("close: #{event.code}(#{event.reason})")
          @ws = nil
          EM.stop
        end
      }
    end

    private

    def set_affiliation(affiliation)
      Affiliation::Self.set affiliation[:self]
      Affiliation::Team.set affiliation[:team]
      Affiliation::SubTeams.set affiliation[:sub_teams]
      Affiliation::Channels.set affiliation[:channels]
      Affiliation::Users.set affiliation[:users]
    end

    # check whether data enable dispatching
    # @param [hash] received data
    def enable_dispatch(data)
      if Spirit.ignore_bot_reply && is_bot_reply?(data)
        return false
      end

      if Spirit.ignore_self_message && is_self_message?(data)
        return false
      end

      true
    end

    # check whether message is bot retry
    # @return [bool]
    def is_bot_reply?(data)
      if data[:type] != 'message'
        return false
      end

      if data[:text] =~ /^\s*<@#{Affiliation::Self.get[:id]}>:?.*$/ && Affiliation::Users.is_bot?(data[:user])
        return true
      end

      false
    end

    # check whether self message
    # @return [bool]
    def is_self_message?(data)
      if data[:type] == 'message' && data[:user] == Affiliation::Self.get[:id]
        return true
      end
      false
    end
  end
end
