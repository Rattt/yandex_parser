#!/bin/bash
gem install bundle ; bundle check || bundle install
if [ -f tmp/pids/server.pid ]; then
  rm -f tmp/pids/server.pid
fi
ls -la
bundle exec rails s -p 3000 -b 0.0.0.0
