Rails.application.routes.draw do
  
  resources :blogs
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "home#index"
  resources :works
  resources :users
  resources :teams do
    resources :members
  end

  resources :blogs do
    resources :comments
  end

  namespace :admin do
    resources :users
  end
end
