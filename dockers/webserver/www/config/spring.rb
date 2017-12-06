# frozen_string_literal: true

%w(
  .ruby-version
  .rbenv-vars
  tmp/restart.txt
  tmp/caching-dev.txt
  app/commands/**
).each { |path| Spring.watch(path) }
