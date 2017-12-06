# frozen_string_literal: true

module YaNews
  # Set news from Yandex
  class Set
    def initialize(news_info)
      @news_info = news_info
    end

    def execute
      redis = ::RedisConnect.get
      last_ya_h = redis.get('last_ya_h') || ''
      last_ya_h_new = XXhash.xxh32(@news_info[:title])
      return nil if last_ya_h_new == last_ya_h
      redis.set('last_ya_h', last_ya_h_new)
      time = { time: Time.now.to_i }
      info = @news_info.merge(time).to_json
      redis.set('last_ya', info)
      Articles::ToPublish.new.execute
      nil
    end
  end
end
