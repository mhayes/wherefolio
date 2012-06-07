Wherefolio::Application.routes.draw do
  root :to => "index#home"
  
  resource :account, only: [:show, :update]
  
  # User Authentication
  match "/auth/twitter/callback" => "sessions#create"
  match "/auth/failure" => "sessions#failure"
  match "/signout" => "sessions#destroy", as: :signout
  
  get "/boom" => "index#boom"
end
