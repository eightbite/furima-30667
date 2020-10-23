class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :category_id, :status_id, :burden_id, :area_id, :day_id)
  end
end
