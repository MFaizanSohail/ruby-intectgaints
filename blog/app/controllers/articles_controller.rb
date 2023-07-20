class ArticlesController < ApplicationController
  def index

    def new
      @article = Article.new
    end
    
    def create
      @article = Article.new(article_params)
    
      if @article.save
        redirect_to @article
      else
        render :new, status: :unprocessable_entity
      end
    end

  end
end


