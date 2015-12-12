require 'json'

module Slatan
  class Spirit
    @slack_api_url = 'https://slack.com/api'
    @slack_token = 'xxxxx-xxxxxx-xxxxxxxxxxxxxxx'
    @logfile_path =  '/tmp/slatan.log'
    @log_level = 'debug'
    @use_log = false

    class << self
      attr_accessor :slack_api_url,
                    :slack_token,
                    :logfile_path
    end
  end
end
