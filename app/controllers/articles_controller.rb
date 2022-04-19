class ArticlesController < ApplicationController

  before_action :require_login , only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      flash.notice = "Article was successfully created."
      redirect_to articles_path
    else
      flash.alert = @article.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
