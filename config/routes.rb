Wherefolio::Application.routes.draw do
  root :to => "index#home"
  
  resource :account, only: [:show, :update]
  resources :projects, only: [:new, :create, :show, :index]
  
  # User Authentication
  match "/auth/twitter/callback" => "sessions#create"
  match "/auth/failure" => "sessions#failure"
  match "/signout" => "sessions#destroy", as: :signout
end
