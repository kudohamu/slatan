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
          @ws.send({type: 'hello'})
        end

        @ws.on :message do |event|
          Buttocks.debug("message: #{event.data}")
          data = JSON.parse(event.data, symbolize_names: true)
          Ear.hear(data)
        end

        @ws.on :close do |event|
          Buttocks.warn("close: #{event.code}(#{event.reason})")
          @ws = nil
          EM.stop
        end
      }
    end

    def set_affiliation(affiliation)
      Affiliation::Self.set affiliation[:self]
      Affiliation::Team.set affiliation[:team]
      Affiliation::SubTeams.set affiliation[:sub_teams]
      Affiliation::Channels.set affiliation[:channels]
      Affiliation::Users.set affiliation[:users]
    end
  end
end
