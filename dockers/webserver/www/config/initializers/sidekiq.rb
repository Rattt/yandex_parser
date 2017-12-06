# frozen_string_literal: tru

select_db = ENV['SIDEKIQ_REDIS_DB']
select_db = ENV['SIDEKIQ_TEST_REDIS_DB'] if Rails.env.test?
host = ENV['REDIS_HOST']
password = ENV['REDIS_PASSWORD']

Sidekiq.configure_client do |config|
  config.redis = { host: host, password: password, db: select_db }
end

Sidekiq.configure_server do |config|
  config.redis = { host: host, password: password, db: select_db }
end
