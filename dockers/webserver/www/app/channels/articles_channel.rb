# frozen_string_literal: true

# Channel for Article
class ArticlesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'articles'
  end
end
