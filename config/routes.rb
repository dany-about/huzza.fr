Rails.application.routes.draw do
  resources :videos
  scope "(:locale)", locale: /en|fr/ do  # Devise route

  # Need to be deleted
  get 'home/index'

  # Home page
  root "home#index"
  end

  devise_for :users

  # Dares route
  resources :dares

  # Avatar route
  resources :users do
    resources :avatars, only: [:create]
  end

end
