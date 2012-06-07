class IndexController < ApplicationController
  before_filter :require_user!, only: :secret
  
  def home
  end
  
  def boom
  end
  
  def boom2
    raise "boom error!"
  end
end
