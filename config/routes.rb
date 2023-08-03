Rails.application.routes.draw do

  root 'dishes#home'
  get '/dishes', to: 'dishes#index'
  get '/signup', to: 'chefs#new'

  resources :dishes do
    resources :comments, only:[:create]

  end 
  resources :chefs, except: [:new]

  get '/login', to: 'sessions#new'
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :ingredients
  mount ActionCable.server => '/cable'
end
