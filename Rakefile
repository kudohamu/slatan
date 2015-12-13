require "bundler/gem_tasks"
require 'erb'
require 'active_support/core_ext/object'
require 'slatan/utils/string_ex'

using Slatan::Utils::StringEx
namespace :slatan do
  desc "Kill slatan daemon process."
  task :stop do
    path = ENV['SLATAN_PID_FILE_PATH'].presence || '/tmp/slatan.pid'
    sh "kill `cat #{path}`"
  end

  desc "Generate event subscriber of slack message."
  task :generate, [:file_path] do |task, args|
    file_name = File.basename(args.file_path, '.*')
    class_name = file_name.camelize
    dir_path = File.dirname(args.file_path)
    File.open('./lib/slatan/template/concern.rb.erb') do |file|
      erb = ERB.new(file.read).result(binding)
      File.open(File.join(dir_path, "#{file_name}.rb"), 'w') do |file|
        file << erb
      end
    end
  end
end
