Rails.application.routes.draw do
  resources :blogs
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end
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
