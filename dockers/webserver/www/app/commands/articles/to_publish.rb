# frozen_string_literal: true

module Articles
  # Publish news to web socket
  class ToPublish
    def execute
      data = Articles::GetFirst.new.execute
      json_data = data.to_json
      ActionCable.server.broadcast 'articles', json_data
    end
  end
end
