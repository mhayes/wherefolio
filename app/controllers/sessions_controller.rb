class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(twitter_uid: request.env["omniauth.auth"]["uid"])
    @user.update_attributes({
      twitter_nickname: request.env["omniauth.auth"]["info"]["nickname"],
      twitter_name: request.env["omniauth.auth"]["info"]["name"],
      twitter_image: request.env["omniauth.auth"]["info"]["image"],
      twitter_location: request.env["omniauth.auth"]["info"]["location"]
    })
    session[:user_id] = @user.id
    redirect_to projects_path, notice: t(:signed_in, name: @user.twitter_name.split.first)
  end
  
  def failure
    redirect_to root_path, alert: params[:message]
  end
  
  def destroy
    # session[:user_id] = nil
    reset_session
    redirect_to root_path, notice: t(:signed_out)
  end
end