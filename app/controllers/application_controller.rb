class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from Exceptions::AccessDenied, with: :access_denied

protected
  def access_denied
    redirect_to root_path, alert: t(:access_denied)
  end

private
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def current_account
    @account ||= current_user.account || current_user.create_account
  end
  helper_method :current_account
  
  def user_signed_in?
    !!current_user
  end
  helper_method :user_signed_in?
  
  def require_user!
    raise Exceptions::AccessDenied unless user_signed_in?
  end
end
