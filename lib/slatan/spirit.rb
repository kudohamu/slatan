require 'json'
require 'active_support/core_ext/object'

module Slatan
  ## Class to retain configure for slatan
  class Spirit
    # about Slack
    @slack_api_url = 'https://slack.com/api'
    @slack_token = ENV['SLATAN_SLACK_TOKEN']

    # about LOGGING
    @log_file_path =  '/tmp/slatan.log'
    @log_level = 'debug'
    @use_log = true

    # about daemon
    @pid_file_path = ENV['SLATAN_PID_FILE_PATH'].presence || '/tmp/slatan.pid'

    # else
    @ignore_bot_reply = true  #be careful sending message loop if you set false.
    @ignore_self_message = true  #be careful sending message loop if you set false.

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
