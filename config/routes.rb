Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end
  root to: "home#index"
  resources :works do
    patch :toggle_status
  end

  resources :users, only: [:index, :show, :edit, :update]
  resources :teams do
    resources :members
  end

  resources :blogs do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  resources :businesses do
    patch :toggle_status
  end


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  namespace :admin do
    resources :users
  end
end
