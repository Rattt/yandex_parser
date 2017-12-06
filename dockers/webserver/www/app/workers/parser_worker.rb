# frozen_string_literal: true

require 'sidekiq-scheduler'

# Worker Parser from Yandex
class ParserWorker
  include Sidekiq::Worker

  def perform
    YaNews::GetParse.new.execute
  end
end
