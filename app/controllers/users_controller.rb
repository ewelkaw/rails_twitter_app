class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new # GET for form to create new user
    @user = User.new
  end

  def create # POST for new user
    @user = User.new(user_params)  
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # the same as redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end