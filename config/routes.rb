Rails.application.routes.draw do
  get 'public_coupons/index'
  get 'public_coupons/show'
  #get 'sessions/new'
  #get 'users/index'
  # get 'coupons/index'
  
  get "signup" => 'users#new'
  get "login" => 'sessions#new'
  get "logout" => 'sessions#destroy'
  
  get '/auth/:provider/callback', to: 'authentications#create'
  
  resources :users
  resources :sessions
  resources :public_coupons
  resources :passes do
    resources :coupons
  end
  
  
  root to: 'home#index'
  get "about" => 'home#about'
  get "claim" => 'public_coupons#index'
  get "feedback" => 'home#feedback'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
