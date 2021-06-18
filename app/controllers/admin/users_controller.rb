class Admin::UsersController < ApplicationController
  before_action :require_login
  before_action :hasMenuPermission
  before_action :hasMenuActionPermission

  layout 'master'

  def index
    query = User.all
    if(params[:user_name])
      query = query.where("user_name LIKE ?", "%#{params[:user_name]}%")
    end
    if(params[:email])
      query = query.where("email LIKE ?", "%#{params[:email]}%")
    end
    @users = query
  end

  def addnew
    @users = User.new
  end
  
  def create
    @user = User.create(user_params)
    @user_roles = UserRole.all
    if @user.valid?
      redirect_to :action =>'index'
    else
      flash[:errors] =  @user.errors.full_messages
      redirect_to :action =>'new'
    end  
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
    @user_roles = UserRole.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_update_params)
      redirect_to :action =>'index'
    else
      render :action => 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def change_password
    @user = User.find(params[:user_id])
  end

  def update_password
    @user = User.find(params[:user_id])
    current_password = params[:user][:old_password]
    user = User.authenticate(@user.email, current_password)
    if @user && user
      user.update_attribute(:password, params[:user][:password])
      flash[:sucess] = "Password successfully changed!"
      redirect_to :action => 'index'
    else
      flash[:danger] = "Your old password was incorrect. Please try again."
      redirect_to :action =>'change_password'
    end
  end

  def user_params
    # render json: params
    params.require(:user).permit(:user_roles_id, :user_name, :email, :mobile, :password)
  end

  def user_change_params
    # render json: params
    params.require(:user).permit(:password)
  end

  def user_update_params
    # render json: params
    params.require(:user).permit(:user_roles_id, :user_name, :email, :mobile)
  end

end