module SessionsHelper
  # Returns the current logged-in user (if any).

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    cookies.permanent.encrypted[:user_id] = nil
    cookies.permanent[:remember_token] = nil
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    cookies.permanent.encrypted[:user_id] = nil
    cookies.permanent[:remember_token] = nil
  end
end