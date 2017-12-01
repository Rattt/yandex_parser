class Article < ApplicationRecord
  after_save :reload_edit
  before_destroy :reload_destroy

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

  def self.last_by_expired
    where("expired_at > ?", DateTime.now).order(expired_at: :desc).first
  end

  def is_yandex
    false
  end

  private

  def active?(article)
    Article.last_by_expired&.id == article.id
  end

  def reload_edit
    if (Article.count == 0 || active?(self))
      Articles::ToPublish.new.execute
    end
  end

  def reload_destroy
    if ( Article.count == 1 ||  active?(self))
      Articles::ToPublish.new.execute
    end
  end
end
