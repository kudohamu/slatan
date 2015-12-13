require "bundler/gem_tasks"
require 'active_support/core_ext/object'

namespace :slatan do
  desc "Kill slatan daemon process."
  task :stop do
    path = ENV['SLATAN_PID_FILE_PATH'].presence || '/tmp/slatan.pid'
    sh "kill `cat #{path}`"
  end
end
