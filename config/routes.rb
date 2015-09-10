Rails.application.routes.draw do
  resources :users do
    resources :submissions, only: [:new, :index, :create]
    resources :challenges, only: [:show]
  end

  
  root to: 'visitors#index'

  # User Auth
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
