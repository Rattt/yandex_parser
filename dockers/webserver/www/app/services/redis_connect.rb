# frozen_string_literal: true

# Connect to Redis
module RedisConnect
  select_db = ENV['REDIS_DB']
  select_db = ENV['REDIS_TEST_DB'] if Rails.env.test?
  host = ENV['REDIS_HOST']
  password = ENV['REDIS_PASSWORD']
  config = { password: password, host: host, db: select_db, driver: :hiredis }
  @redis = Redis.new(config)
  class << self
    def get
      @redis
    end
  end
end
