Rails.application.routes.draw do
  resources :videos
  scope "(:locale)", locale: /en|fr/ do  # Devise route

  # Need to be deleted
  get 'home/index'
  get 'home/test_card'
  get 'home/testdany'
  get 'home/chantier_card'
  get 'users/showtest'

  # Home page
  devise_for :users
  resources :users, only: [:show]
  
  resources :dares, except: [:show, :destroy]
  resources :participations, only: [:create, :update]
  resources :news, only: [:index]

  resources :user_send_dares, only: [:create, :update]
  resources :star_dares, only: [:create, :destroy]
  resources :difficulty_ratings, only: [:create]
  resources :reactions, only: [:create, :update, :destroy]
  resources :comments, only: [:create, :update, :destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"
  end

  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
  }

  post '/sign_up_validation', to: 'users/omniauth_callbacks#sign_up_validation'

  # Dares route
  resources :dares

  # Avatar route
  resources :users do
    resources :avatars, only: [:create]
  end

end