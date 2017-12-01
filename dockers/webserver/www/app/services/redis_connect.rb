module RedisConnect
  select_db = ENV['REDIS_DB']
  if(Rails.env.test?)
    select_db = ENV['REDIS_TEST_DB']
  end
  host = ENV['REDIS_HOST']
  password = ENV['REDIS_PASSWORD']
  @redis = Redis.new ({password: password, host: host,
    db: select_db}).merge({driver: :hiredis})
  class << self
    def get
      @redis
    end
  end
end