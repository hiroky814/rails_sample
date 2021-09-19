rails_root = ENV['RAILS_ROOT']
worker_processes Integer(ENV['WEB_CONCURRENCY'] || 1)
timeout 300 # タイムアウト
preload_app true # 更新時ダウンタイム無し

# listen 8080
listen "#{rails_root}/tmp/unicorn.sock"
pid "#{rails_root}/tmp/unicorn.pid"

# ログの出力
stderr_path File.expand_path('log/unicorn.log', rails_root)
stdout_path File.expand_path('log/unicorn.log', rails_root)