module YaNews
  class GetParse

    YANDEX_NEWS = 'https://www.yandex.ru/'

    def execute
      begin
        news_info = first_article
      rescue StandardError => e
        logger = LogConnect.get
        logger.error 'YaNews::GetParse: ошибка может быть вызвана устареванием селектора'
        logger.error "YaNews::GetParse: #{e.message}"
      end
      news_info
      ::YaNews::Set.new(news_info).execute
    end

    private

    def article_url
      html = Nokogiri::HTML(open(YANDEX_NEWS))
      selector = 'div.content-tabs__items a.list__item-content'
      article_link = html.css(selector).first
      article_link[:href]
    end

    def first_article
      html = Nokogiri::HTML(open(article_url))
      title, description = ['h1.story__head', 'div.doc__text'].map do |selector|
        html.css(selector).first.text
      end
      {title: title, description: description}
    end
  end
end

