class Admin::CatagoriesController < ApplicationController
  before_action :require_login
  before_action :hasMenuPermission
  before_action :hasMenuActionPermission
  
  layout 'master'
  def index
    query = Catagory
    if(current_user.id ==1)
      query = query.all
    else
      query = query.where("users_id=?", "#{current_user.id}")
    end
    if(params[:title])
      query = query.where("title LIKE ?", "%#{params[:title]}%")
    end
    if(params[:status])
      query = query.where("status LIKE ?", "%#{params[:status]}%")
    end
    @catagories = query
  end

  def new
    @catagories = Catagory.new
  end

  def create
    @category = Catagory.create(category_params)
    if @category.valid?
      redirect_to :action =>'index'
    else
      flash[:errors] =  @category.errors.full_messages
      redirect_to :action =>'new'
    end  
  end

  def show
  end

  def edit
    @category = Catagory.find(params[:id])
  end

  def update
    @Catagory = Catagory.find(params[:id])
    if @Catagory.update(category_params)
      redirect_to :action =>'index'
    else
      render :action => 'edit'
    end
  end

  def destroy
    Catagory.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def publish
    @Catagory = Catagory.find(params[:catagory_id])
    if @Catagory 
      @Catagory.update_column(:status, 1)
      redirect_to :action => 'index'
    end
  end

  def unpublish
    @Catagory = Catagory.find(params[:catagory_id])
    if @Catagory 
      @Catagory.update_column(:status, 0)
      redirect_to :action => 'index'
    end
  end  

  def category_params
    user_id = current_user.id
    params.require(:category).permit(:title, :slug, :content).merge!({users_id: user_id})
  end

end
