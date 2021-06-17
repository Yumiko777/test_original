Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "home#index"
  resources :works
  resources :users
  resources :teams

  namespace :admin do
    resources :users, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
    end
  end
end
