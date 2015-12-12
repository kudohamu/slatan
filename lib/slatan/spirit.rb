require 'json'

module Slatan
  ## Class to retain configure for slatan
  class Spirit
    # about Slack
    @slack_api_url = 'https://slack.com/api'
    @slack_token = 'xxxxx-xxxxxx-xxxxxxxxxxxxxxx'

    # about LOGGING
    @logfile_path =  '/tmp/slatan.log'
    @log_level = 'fatal'
    @use_log = false

    class << self
      attr_accessor :slack_api_url,
                    :slack_token,
                    :logfile_path,
                    :use_log
    end
  end
end
