module YaNews
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
      info = (@news_info.merge({time: Time.now.to_i})).to_json
      redis.set('last_ya', info)
      Articles::ToPublish.new.execute
      nil
    end
  end
end