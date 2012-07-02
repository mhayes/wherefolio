Wherefolio::Application.routes.draw do
  root :to => "index#home"
  
  resource :account, only: [:show, :update]
  resources :projects, only: [:create, :edit, :index] do
    resources :photos, :only => [:create, :destroy] do
      collection do
        post :sort
      end
    end
  end
  
  # User Authentication
  match "/auth/twitter/callback" => "sessions#create"
  match "/auth/failure" => "sessions#failure"
  match "/signout" => "sessions#destroy", as: :signout
end
