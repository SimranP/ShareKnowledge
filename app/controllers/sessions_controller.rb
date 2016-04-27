class SessionsController < ApplicationController
  def create
    user = User.omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    p user.id ,"=================================================================================="
    redirect_to ""
  end

  def destroy
    session[:user_id] = nil
  end
end
