# frozen_string_literal: true

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
ENV.each { |k, v| env(k, v) }

# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + '/environment')
# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, rails_env
# cronのログの吐き出し場所
set :output, "#{Rails.root}/log/cron.log"

# 開発モード以外で実行
if rails_env.to_sym != :development
  every 1.day, at: '0:00 am' do
    rake 'calibration_alert:alert'
  end

  # entry not enterd alerm
  every 1.day, at: '12:00 pm' do
    rake 'entry_not_enterd_alert:alert'
  end

  # cancel entry
  every 1.day, at: '5:00 pm' do
    rake 'cancel_entry:cancel'
  end
end
