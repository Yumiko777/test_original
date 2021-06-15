Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :works
  resources :users
end
