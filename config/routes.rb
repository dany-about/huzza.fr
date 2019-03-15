Rails.application.routes.draw do
  resources :videos

    devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

    scope '/(:locale)', locale: /en|fr/ do
      devise_for :users, skip: :omniauth_callbacks
    end

    # Avatar routes
    resources :users do
      resources :avatars, only: [:create]
    end

    # Need to be deleted
  get 'home/test_card'
  get 'home/testdany'
  get 'home/chantier_card'
  get 'users/showtest'

  # Home page
  root 'news#index'

  resources :users, only: [:show]
  resources :follows, only: [:create, :destroy]
  resources :friend_requests, only: [:create, :destroy]
  
  resources :dares, except: [:show, :destroy]
  resources :participations, only: [:create, :update]
  resources :news, only: [:index]

  resources :user_send_dares, only: [:create, :update]
  resources :star_dares, only: [:create, :destroy]
  resources :difficulty_ratings, only: [:create]
  resources :reactions, only: [:create, :update, :destroy]
  resources :comments, only: [:create, :update, :destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/sign_up_validation', to: 'users/omniauth_callbacks#sign_up_validation'

end