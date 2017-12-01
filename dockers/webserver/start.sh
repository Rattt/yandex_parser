#!/bin/bash
bundle check || bundle install
if [ -f tmp/pids/server.pid ]; then
  rm -f tmp/pids/server.pid
fi
ls -la
bundle exec sidekiq -d -L log/sidekiq.log
bundle exec rails s -p 3000 -b 0.0.0.0
