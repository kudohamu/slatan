require 'slatan/spirit'
require 'slatan/buttocks'

require 'faye/websocket'
require 'eventmachine'
require 'json'

module Slatan
  class Heart
    def beat()
      req = Net::HTTP.post_form URI("#{Spirit.slack_api_url}/rtm.start"), token: Spirit.slack_token
      parsed_body = JSON.parse(req.body, symbolize_names: true)
      ws_url = parsed_body[:url]
      EM.run {
        @ws = Faye::WebSocket::Client.new(ws_url)

        @ws.on :open do |event|
          p [:open]
          Buttocks.debug('open')
          @ws.send({type: 'hello'})
        end

        @ws.on :message do |event|
          p [:message, event.data]
          Buttocks.debug("message: #{event.data}")
          data = JSON.parse(event.data, symbolize_names: true)
          Ear.hear(data)
        end

        @ws.on :close do |event|
          p [:close, event.code, event.reason]
          Buttocks.debug("close: #{event.code}(#{event.reason})")
          @ws = nil
          EM.stop
        end
      }
    end
  end
end
