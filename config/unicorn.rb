rails_root = ENV['RAILS_ROOT']
worker_processes Integer(ENV['WEB_CONCURRENCY'] || 3)
timeout 300 # タイムアウト
preload_app true # 更新時ダウンタイム無し

listen "#{rails_root}/tmp/unicorn.sock"
pid "#{rails_root}/tmp/unicorn.pid"

before_fork do |_server, _worker|
  ENV['BUNDLE_GEMFILE'] = File.expand_path('Gemfile', rails_root)

  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |_server, _worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection
end

# ログの出力
stderr_path File.expand_path('log/unicorn.log', rails_root)
stdout_path File.expand_path('log/unicorn.log', rails_root)