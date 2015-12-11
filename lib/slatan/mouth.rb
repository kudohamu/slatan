require 'slatan/spirit'
require 'slatan/api_wrapper/chat'

require 'net/http'

module Slatan
  module Mouth
    include Chat

    class << self
      def send(method, msg)
        base_url = 'https://slack.com/api'
        msg = {
          channel: 'C04QLLWR6',
          as_user: true,
          token: Spirit.see[:slack_token]
        }.merge(msg)

        uri = URI.parse("#{base_url}/#{method}?#{URI.encode_www_form(msg)}")
        request = Net::HTTP::Post.new(uri.request_uri, {
          'Content-Type' =>'application/json'
        })
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        http.start do |h|
          response = h.request(request)
        end
      end
    end
  end
end
