Rails.application.routes.draw do

  # Need to be deleted
  get 'home/index'

  # Home page
  root "home#index"

  # Devise route
  devise_for :users

  # Dares route
  resources :dares

  # Avatar route
  resources :users do
    resources :avatars, only: [:create]
  end
end
