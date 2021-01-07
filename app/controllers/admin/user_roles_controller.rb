class Admin::UserRolesController < ApplicationController
  before_action :require_login
  before_action :checkContentPermissioninnerAction
  before_action :checkContentPermission
  
  layout 'master'
  def index
    @user_roles = UserRole.all
  end

  def new
    @user_roles = UserRole.new
    # render json: menuAll
  end

  def create
    @user_roles = UserRole.new(role_params)
    if @user_roles.save
      redirect_to :action =>'index'
    else
      redirect_to :action =>'new'
    end
  end

  def show
  end

  def edit
    @user_role = UserRole.find(params[:id])
  end

  def update
    @user_roles = UserRole.find(params[:id])
    if @user_roles.update(role_params)
      redirect_to :action =>'index'
    else
      render :action => 'edit'
    end
  end

  def destroy
    UserRole.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def publish
    @user_roles = UserRole.find(params[:user_role_id])
    if @user_roles 
      @user_roles.update_column(:status, 1)
      redirect_to :action => 'index'
    end
  end

  def unpublish
    @user_roles = UserRole.find(params[:user_role_id])
    if @user_roles 
      @user_roles.update_column(:status, 0)
      redirect_to :action => 'index'
    end
  end

  def permission
    @user_menu = UserMenu.getMenus.all
    @user_roles = UserRole.where(id: params[:user_role_id]).first
    # render json: @user_roles.permission
  end

  def permissionUpdate
    @user_roles = UserRole.find(params[:user_role_id])
    usermenu = stringToArray(params[:usermenu])
    usermenuAction = stringToArray(params[:usermenuAction])
    if @user_roles 
      @user_roles.update_attributes(:permission => usermenu, :actionPermission => usermenuAction)
      redirect_to :action => 'index'
    end
  end

  def stringToArray(valuSplit)
    if(valuSplit !=nil)
      return valuSplit.map(&:to_i).join(',')
    else
      return valuSplit
    end
  end

  def role_params
    params.require(:user_role).permit(:name)
  end

end
