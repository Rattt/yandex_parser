# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:valid_article) { FactoryGirl.build(:article) }

  it 'article is valid' do
    expect(valid_article).to be_valid
  end

  it '#last_by_expired' do
    article_first = valid_article
    article_first.expired_at = Time.now.to_date.next_day(1).to_time
    article_first.save
    article_last = article_first.dup
    article_last.expired_at = Time.now
    article_last.save
    expect(Article.last_by_expired).to eql(article_first)
  end

  context 'fails' do
    it 'with a dublicate title' do
      article_first = valid_article
      article_first.save
      article_last = article_first.dup
      article_last.valid?
      expect(article_last.errors.messages[:title]).to include('has already been taken')
    end

    it 'with empty title' do
      article = valid_article
      article.title = ''
      article.valid?
      expect(article.errors.messages[:title]).to include("can't be blank")
    end

    it 'with empty description' do
      article = valid_article
      article.description = ''
      article.valid?
      expect(article.errors.messages[:description]).to include("can't be blank")
    end
  end
end
