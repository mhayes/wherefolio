Wherefolio::Application.routes.draw do
  root :to => "index#home"
  
  # User Authentication
  match "/auth/twitter/callback" => "sessions#create"
  match "/auth/failure" => "sessions#failure"
  match "/signout" => "sessions#destroy"
end
