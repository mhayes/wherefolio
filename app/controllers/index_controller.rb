class IndexController < ApplicationController
  before_filter :require_user!, only: :secret
  before_filter :redirect_if_logged_in!
  
  def home
  end

private

  def redirect_if_logged_in!
    redirect_to projects_path if user_signed_in?
  end
end
