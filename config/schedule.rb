# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#

# every '0 0 * * *' do

# every :minute do
# every 1.day, at: '17:04 pm' do
#   runner "Business.created_at_check"
# end

env :PATH, ENV['PATH']
set :output, 'log/crontab.log'
set :environment, ENV['RAILS_ENV']
# set :job_template, "/bin/zsh -l -c ':job'"
# job_type :rake, "export PATH=\"$HOME/.rbenv/bin:$PATH\"; eval \"$(rbenv init -)\"; cd :path && RAILS_ENV=:environment bundle exec rake :task ：output"

every 1.minute do
  # bundle exec rake "created_at_check:test"
  rake "created_at_check:test"
end
# Learn more: http://github.com/javan/whenever
