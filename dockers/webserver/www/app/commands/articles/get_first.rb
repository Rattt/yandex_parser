# frozen_string_literal: true

module Articles
  # Get first article to publish or new
  class GetFirst
    def execute
      Article.last_by_expired || YaNews::Get.new.execute || Article.new
    end
  end
end
