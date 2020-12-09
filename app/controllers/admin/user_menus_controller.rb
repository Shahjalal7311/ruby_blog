class Admin::UserMenusController < ApplicationController
  before_action :require_login
  layout 'master'
  def index
    @user_menus = UserMenu.all
  end

  def new
    @user_menus = UserMenu.new
    @menuAll = UserMenu.all
    @order_count = @menuAll.count()+1
    # render json: menuAll
  end

  def create
    @user_menus = UserMenu.new(user_menu_params)
    if @user_menus.save
      redirect_to :action =>'index'
    else
      redirect_to :action =>'new'
    end
  end

  def show
  end

  def edit
    @user_menu = UserMenu.find(params[:id])
    @menuAll = UserMenu.all
  end

  def update
    @user_menus = UserMenu.find(params[:id])
    if @user_menus.update(menus_params)
      redirect_to :action =>'index'
    else
      render :action => 'edit'
    end
  end

  def destroy
    UserMenu.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def publish
    @user_menu = UserMenu.find(params[:user_menu_id])
    if @user_menu 
      @user_menu.update_column(:menuStatus, 1)
      redirect_to :action => 'index'
    end
  end

  def unpublish
    @user_menu = UserMenu.find(params[:user_menu_id])
    if @user_menu 
      @user_menu.update_column(:menuStatus, 0)
      redirect_to :action => 'index'
    end
  end

  def link
    
  end

  def user_menu_params
    params.require(:user_menu).permit(:parentMenu,:menuName,:menuLink,:menuIcon,:orderBy)
  end

end
