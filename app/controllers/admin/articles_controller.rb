class Admin::ArticlesController < ApplicationController
  before_action :require_login
  layout 'master'
  def index
    @articles = Article.joins(:catagory)
  end

  def new
    @articles = Article.new
    @catagories = Catagory.all
  end

  def create
    @article = Article.create(article_params)
    if @article.valid?
      redirect_to :action =>'index'
    else
      flash[:errors] =  @article.errors.full_messages
      redirect_to :action =>'new'
    end  
  end

  def show
  end

  def edit
    @article = Article.find(params[:id])
    @catagories = Catagory.all
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to :action =>'index'
    else
      render :action => 'edit'
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def article_params
    slug12 = chnage_slug(params[:article][:slug])
    params.require(:article).permit(:title,:content,:catagories_id).merge!({slug: slug12})
  end

  def chnage_slug(param)
    return param.downcase.tr!(" ", "-")
  end

end
