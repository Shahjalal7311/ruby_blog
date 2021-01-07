class Admin::ArticlesController < ApplicationController
  before_action :require_login
  before_action :checkContentPermissioninnerAction
  before_action :checkContentPermission
  
  layout 'master'
  def index
    @articles = Article.joins(:catagory)
  end

  def new
    @articles = Article.new
    @catagories = Catagory.published_status.all
  end

  # def create
  #   @article = Article.create(article_params)
  #   if @article.valid?
  #     params[:post_attachments]['avatar'].each do |a|
  #     @post_attachment = @article.post_attachments.create!(:avatar => a)
  #    end
  #     redirect_to :action =>'index'
  #   else
  #     flash[:errors] =  @article.errors.full_messages
  #     redirect_to :action =>'new'
  #   end  
  # end
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to :action =>'index'
    else
      redirect_to :action =>'new'
    end
  end

  def show
  end

  def edit
    @article = Article.find(params[:id])
    @catagories = Catagory.published_status.all
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params_up)
      redirect_to :action =>'index'
    else
      render :action => 'edit'
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def publish
    @article = Article.find(params[:article_id])
    if @article 
      @article.update_column(:status, 1)
      redirect_to :action => 'index'
    end
  end

  def unpublish
    @article = Article.find(params[:article_id])
    if @article 
      @article.update_column(:status, 0)
      redirect_to :action => 'index'
    end
  end

  def article_params
    slug12 = change_slug(params[:article][:slug])
    user_id = current_user.id
    params.require(:article).permit(:title,:content,:catagories_id,:attachment).merge!({slug: slug12, users_id: user_id})
  end

  def article_params_up
    @article = Article.find(params[:id])
    user_id = current_user.id
    params.require(:article).permit(:title,:content,:catagories_id,:slug,:attachment).merge!({users_id: user_id})
  end

  def change_slug(param)
    return param.downcase.tr!(" ", "-")
  end

end
