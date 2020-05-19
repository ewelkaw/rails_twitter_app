class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      redirect root_path
    else
      render 'new'
    end
  end

  def destroy
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
