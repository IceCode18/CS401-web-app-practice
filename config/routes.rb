Rails.application.routes.draw do
  get 'coupons/index'
  resources :passes
  root to: 'home#index'
  get "claim" => 'home#claim'
  get "feedback" => 'home#feedback'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
