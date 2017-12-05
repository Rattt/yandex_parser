module Admin
  class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :destroy]

    # GET /articles
    def index
      @article = Article.last_by_expired || Article.new
      @articles = Article.order(expired_at: :desc)
    end

    # GET /articles/new
    def new
      @article = Article.new
    end

    # GET /articles/1/edit
    def edit
    end

    # POST /articles
    def create
      @article = Article.new(article_params)
      respond_to do |format|
        if @article.save
          format.html {redirect_to admin_articles_path, notice: t('.notice')}
        else
          format.html {render :new}
        end
      end
    end

    # PATCH/PUT /articles/1
    def update
      respond_to do |format|
        if @article.update(article_params)
          format.html {redirect_to admin_articles_path, notice: t('.notice')}
        else
          format.html {render :edit}
        end
      end
    end

    # DELETE /articles/1
    def destroy
      @article.destroy
      respond_to do |format|
        format.html {redirect_to admin_articles_path, notice: t('.notice')}
      end
    end

    private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.fetch(:article).permit(:title, :description, :expired_at)
    end
  end
end
