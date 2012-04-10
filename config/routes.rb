RailsBoilerplate::Application.routes.draw do

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions
  get "secret" => "home#secret", :as => "secret"
  
  match "oauth/callback" => "oauths#callback"
  match "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  namespace :admin do
    get 'settings/:action' => 'settings#:action', :as => :settings
  end
  root :to => 'home#index'
end
