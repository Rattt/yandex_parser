require 'sidekiq-scheduler'

class ParserWorker
  include Sidekiq::Worker

  def perform
    Articles::ToPublish.new.execute
  end
end   
