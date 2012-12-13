require 'open3'
require 'lib/guard/jasmine'

namespace :js do
  namespace :test do
    task :start_jasmine_runner => :environment do
      port = (ENV['JS_PORT'] || 5555)
      Open3.popen3("bundle exec padrino start -p #{port}")
      sleep 90
      puts "Padrino + Jasmine started!"
    end

    task :run_phantomjs => :environment do
      port = (ENV['JS_PORT'] || 5555)
      sh "bundle exec guard-jasmine -u http://localhost:#{port}/jasmine"
    end

    task :stop_jasmine_runner => :environment do
      port = (ENV['JS_PORT'] || 5555)

      sin, sout, serr = Open3.popen3("lsof -i tcp:5555")
      lines = sout.readlines
      line  = lines.grep(/ruby/)
      raise "Could not locate running test padrino server!" if line.empty?

      pid = line.first.split[1]
      Open3.popen3("kill -9 #{pid}")
      puts "Padrino + Jasmine stopped."
    end
  end
 
  desc "Run jasmine/coffeescript specs, headlessly"
  task :test => ['js:test:start_jasmine_runner', 'js:test:run_phantomjs', 'js:test:stop_jasmine_runner']
end