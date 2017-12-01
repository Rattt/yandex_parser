class ArticlesController < ApplicationController

  # GET /show
  def show
    @article = Articles::GetFirst.new.execute
  end
end
