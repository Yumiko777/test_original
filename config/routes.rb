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


  resources :users, only: [:index, :show, :edit, :update]
  resources :teams do
    resources :members, module: :teams
    resources :works, module: :teams do
      patch :toggle_status
    end
    resources :blogs, module: :teams do
      resources :comments, only: [:create, :edit, :update, :destroy]
    end
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
