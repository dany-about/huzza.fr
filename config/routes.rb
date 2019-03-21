Rails.application.routes.draw do

  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  scope '/(:locale)', locale: /en|fr/ do
      devise_for :users, skip: :omniauth_callbacks
  end

  post '/sign_up_validation', to: 'users/omniauth_callbacks#sign_up_validation'

  # Avatar routes
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

  get 'home/team'

  # Home page
  root 'news#index'

  resources :follows, only: [:create, :destroy]
  resources :friend_requests, only: [:create, :update, :destroy]
  
  resources :dares, except: [:show, :edit, :update, :destroy]
  resources :participations, only: [:create, :update] do 
    resources :pictures, only: [:create]
    resources :videos, only: [:create]
  end
  resources :news, only: [:index]

  resources :user_send_dares, only: [:create, :update]
  resources :star_dares, only: [:create, :destroy]
  resources :difficulty_ratings, only: [:create]
  resources :reactions, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :contestations, only: [:create]

end