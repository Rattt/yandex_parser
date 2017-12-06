# frozen_string_literal: true

module YaNews
  # Get last news will be parsed or new
  class Get
    def execute
      redis = ::RedisConnect.get
      str = redis.get('last_ya')
      YaNews::GetParse.new.execute if str.nil?
      str = redis.get('last_ya')
      return if str.nil?
      y_hash = JSON.parse(str).with_indifferent_access
      yandex = { is_yandex: true }
      OpenStruct.new(y_hash.merge(yandex))
    end
  end
end
