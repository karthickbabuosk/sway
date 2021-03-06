class ApplicationController < ActionController::Base
  protect_from_forgery

  #filter_parameter_logging :password, :password_confirmation

  helper_method :current_user_session, :current_user, :signed_in?, :current_property

  private 

  def current_user_session
  	return @current_user_session if defined?(@current_user_session)
  	@current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
  	unless current_user
  		flash[:notice] = "You must be logged in to access this page"
  		redirect_to signin_url
  		return false
  	end
  end

  def redirect_back_or_default(default)
  	redirect_to(session[:return_to] || default)
  end

  def signed_in?
  	return !current_user.nil?
  end
end
