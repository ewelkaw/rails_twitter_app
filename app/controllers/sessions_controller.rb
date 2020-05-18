class SessionsController < ApplicationController
  def new
  end

  def create
    render 'new'
  end

  def destroy
  end

  private
  def session_params
    params.require(:email, :password).permit(:email, :password)
  end
end
