class IndexController < ApplicationController
  before_filter :require_user!, only: :secret
  
  def home
  end
  
  def secret
    
  end
end
