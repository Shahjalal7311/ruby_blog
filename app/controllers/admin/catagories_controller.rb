class Admin::CatagoriesController < ApplicationController
  before_action :require_login
  layout 'master'
  def index
    @catagories = Catagory.all
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

  def category_params
    params.require(:category).permit(:title, :slug, :content)
  end

end
