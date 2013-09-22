class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :session_exist?, :current_user

  def session_exist?
    !!session[:token]
  end

  def current_user
    User.find_by_token(session[:token])
  end

end
