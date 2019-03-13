Rails.application.routes.draw do

  get 'home/index'
  get 'home/test_card'
  get 'home/testdany'

  resources :dares
  resources :participations, only: [:create, :update]
  resources :user_send_dares, only: [:create, :update]
  resources :users, only: [:show]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

end