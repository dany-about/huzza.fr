Rails.application.routes.draw do
  scope "(:locale)", locale: /en|fr/ do  # Devise route

  # Need to be deleted
  get 'home/index'

  # Home page
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
