require 'json'

module Slatan
  ## Class to retain configure for slatan
  class Spirit
    # about Slack
    @slack_api_url = 'https://slack.com/api'
    @slack_token = 'xxxxx-xxxxxx-xxxxxxxxxxxxxxx'

    # about LOGGING
    @log_file_path =  '/tmp/slatan.log'
    @log_level = 'debug'
    @use_log = true

    # about daemon
    @pid_file_path = '/tmp/slatan.pid'

    class << self
      attr_accessor :slack_api_url,
                    :slack_token,
                    :log_file_path,
                    :log_level,
                    :use_log,
                    :pid_file_path
    end
  end
end
