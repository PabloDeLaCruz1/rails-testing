class ArticlesController < ApplicationController
  def new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    #lets you see what params are being passed by the form in views/articles/new.html.erb
    # render plain: params[:article].inspect

    #save article to db
    @article = Article.new(article_params)

    @article.save
    redirect_to @article
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
