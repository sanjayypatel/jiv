class SessionsController < ApplicationController

  def create
    # raise env["omniauth.auth"].to_yaml
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    reset_session
    session[:access_token] = auth.credentials.token
    session[:user_id] = user.id
    redirect_to user_path(user), :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    session[:access_token] = nil
    reset_session
    redirect_to root_url, :notice => "Signed out!"
  end

end
