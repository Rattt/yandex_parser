# frozen_string_literal: true

module YaNews
  # Parse news from Yandex
  class GetParse
    YANDEX_NEWS = 'https://www.yandex.ru/'
    PARSER_PATH = Rails.root.join('parser.js')

    def execute
      url = article_url
      return if parsed?(url)
      news_info = first_article(url)
      ::YaNews::Set.new(news_info).execute
    rescue StandardError => e
      logger = LogConnect.get
      logger.error 'YaNews::GetParse: ошибка может быть вызвана устареванием селектора'
      logger.error "YaNews::GetParse: #{e.message}"
    end

    private

    def article_url
      html = Nokogiri::HTML(get_content(YANDEX_NEWS))
      selector = 'div.content-tabs__items a.list__item-content'
      article_link = html.css(selector).first
      article_link[:href]
    end

    def first_article(url)
      html = Nokogiri::HTML(get_content(url))
      title, description = ['h1.story__head', 'div.doc__text'].map do |selector|
        html.css(selector).first.text
      end
      { title: title, description: description }
    end

    def get_content(url)
      `phantomjs #{PARSER_PATH} #{url}`
    end

    def parsed?(url)
      redis = ::RedisConnect.get
      last_ya_h = redis.get('last_ya_h') || ''
      last_ya_h_new = XXhash.xxh32(url)
      return true if last_ya_h_new == last_ya_h
      redis.set('last_ya_h', last_ya_h_new)
      false
    end
  end
end
