# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
require File.expand_path(File.dirname(__FILE__) + '/environment')
# rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
# set :environment, rails_env
# cronのログの吐き出し場所
# set :output, "#{Rails.root}/log/cron.log"
set :environment, :development
# env :PATH, ENV['PATH']
# set :output, 'log/cron.log'
# set :environment, :development



set :environment, Rails.env
set :output, { :error => 'log/whenever.log', :standard => 'log/cron.log' }

# every '0 0 * * *' do
# every 10.seconds do
# every :minute do
every 1.day, at: '12:20 am' do
  runner "Business.created_at_check"
end

# Learn more: http://github.com/javan/whenever
