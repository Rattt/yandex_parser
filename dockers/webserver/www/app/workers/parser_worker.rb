require 'sidekiq-scheduler'

class ParserWorker
  include Sidekiq::Worker

  def perform
    YaNews::GetParse.new.execute
  end
end   
