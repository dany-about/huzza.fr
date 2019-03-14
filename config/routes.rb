Rails.application.routes.draw do

  get 'home/index'
  get 'home/test_card'
  get 'home/testdany'
  get 'home/chantier_card'
  get 'users/showtest'

  devise_for :users
  resources :users, only: [:show]
  resources :news, only: [:index]
  
  resources :dares, except: [:show, :destroy]
  resources :participations, only: [:create, :update]

  resources :user_send_dares, only: [:create, :update]
  resources :star_dares, only: [:create, :destroy]
  resources :difficulty_ratings, only: [:create]
  resources :reactions, only: [:create, :update, :destroy]
  resources :comments, only: [:create, :update, :destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

end