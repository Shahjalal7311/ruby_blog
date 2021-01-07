class Admin::UserMenusController < ApplicationController
  before_action :require_login
  before_action :checkContentPermissioninnerAction
  before_action :checkContentPermission
  
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
    if @user_menus.update(user_menu_params)
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
    @id = params[:user_menu_id]
    @user_view_menus = UserMenuAction.where(user_menu_id: @id)
  end

  def addlink
    @id = params[:user_menu_id]
    @count_usr_order = UserMenuAction.all.count()+1
  end

  def createlink
    @user_view_menus = UserMenuAction.new(user_add_params)
    if @user_view_menus.save
      redirect_to :action =>'link'
    else
      redirect_to :action =>'addlink'
    end
  end

  def addlinkedit
    @user_menu = UserMenuAction.find(params[:user_menu_id])
  end

  def updateLinkedit
    @user_view_menus = UserMenuAction.find(params[:user_menu_id])
    if @user_view_menus.update(user_add_params)
      redirect_to controller: 'user_menus', action: 'link'
    else
      render :action => 'addlinkedit'
    end
  end

  def destroyAction
    UserMenuAction.find(params[:id]).destroy
    redirect_to :action => 'link'
  end

  def user_menu_params
    params.require(:user_menu).permit(:parentMenu,:menuName,:menuLink,:menuIcon,:orderBy)
  end

  def user_add_params
    params.require(:user_menu).permit(:menuType,:user_menu_id,:actionName,:actionLink,:orderBy,:actionStatus)
  end

end
