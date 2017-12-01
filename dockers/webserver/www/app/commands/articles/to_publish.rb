module Articles
  class ToPublish
    def execute
      data = Articles::GetFirst.new.execute
      json_data = data.to_json
      ActionCable.server.broadcast 'articles', json_data
    end
  end
end
