class Admin::UsersController < ApplicationController
  before_action :require_login
  layout 'master'

  def index
    @users = User.all
  end

  def addnew
    @users = User.new
  end
  
  def create
    @user = User.create(user_params)
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

  def user_update_params
    # render json: params
    params.require(:user).permit(:f_name,:l_name,:user_name, :email, :mobile)
  end

  def user_params
    # render json: params
    params.require(:user).permit(:f_name,:l_name,:user_name, :email, :mobile, :password)
  end

end