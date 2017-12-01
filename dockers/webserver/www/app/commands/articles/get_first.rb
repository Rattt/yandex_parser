module Articles
  class GetFirst
    def execute
      Article.last_by_expired || YaNews::Get.new.execute
    end
  end
end
