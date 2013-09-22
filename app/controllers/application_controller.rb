class ApplicationController < ActionController::Base
  protect_from_forgery :except => [:examine]

  helper_method :session_exist?, :current_user


  def login(user)
    user.set_token
    session[:token] = user.token
    user.save!
  end
  
  def current_user
    session_token = session[:token]
    user = User.find_by_token(session_token)
    if session_token && user
      user
    else 
      nil
    end
  end

  def current_rider 
 	current_user.riders.first
  end

end
