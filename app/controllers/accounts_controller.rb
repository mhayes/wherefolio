class AccountsController < ApplicationController
  before_filter :require_user!
  
  def show
  end
  
  def update
    if current_account.update_attributes(params[:account])
      redirect_to account_path, notice: t(:update_account_success)
    else
      render action: :show
    end
  end
end