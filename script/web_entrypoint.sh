#!/bin/sh

date +%Y%m%d%H%I%s

if [ "${RAILS_ENV}" = "production" ]; then
  rake assets:precompile
fi

rm tmp/pids/server.pid

bundle exec unicorn -c config/unicorn.rb -E $RAILS_ENV -l 3000
