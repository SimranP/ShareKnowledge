class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    if session[:user_id] != nil
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    else
      @current_user = nil
    end
  end
end
