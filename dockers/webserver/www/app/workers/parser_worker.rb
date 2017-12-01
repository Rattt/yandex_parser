require 'sidekiq-scheduler'

class ParserWorker
  include Sidekiq::Worker

  def perform
    YaNews::GetPars.new.execute
  end
end   
