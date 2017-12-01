module YaNews
  class Get
    def execute
      redis = ::RedisConnect.get
      str = redis.get('last_ya')
      YaNews::GetParse.new.execute if str.nil?
      str = redis.get('last_ya')
      return if str.nil?
      y_hash = JSON.parse(str).with_indifferent_access
      OpenStruct.new(y_hash.merge({is_yandex: true}))
    end
  end
end
