Rails.application.routes.draw do
  #get 'users/index'
  # get 'coupons/index'
  
  resources :users
  resources :passes do
    resources :coupons
  end
  
  
  root to: 'home#index'
  get "about" => 'home#about'
  get "claim" => 'home#claim'
  get "feedback" => 'home#feedback'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
