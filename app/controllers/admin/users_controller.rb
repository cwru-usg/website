class Admin::UsersController < Admin::AdminController
  def index
    @users = User.all
    @user  = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
    @user.save
    redirect_to admin_users_url
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url
  end
end