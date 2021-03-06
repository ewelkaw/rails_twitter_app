class UsersController < ApplicationController
  include ApplicationHelper
  include SessionsHelper
  before_action :logged_in_user, only: [:edit, :update, :index, :destroy]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
    # if !logged_in?
    #   redirect_to login_url
    # end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_url
    end
  end

  def update
    @user = User.find(params[:id])
    if current_user != @user
        redirect_to root_url
    elsif @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
