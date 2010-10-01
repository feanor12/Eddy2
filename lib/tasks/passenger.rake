require 'fileutils'
namespace :passenger do
  desc "Restart Application"
  task :restart do
    puts "create restart.txt"
    path = File.join ::Rails.root,"tmp/restart.txt"
    FileUtils.touch path
  end
end
