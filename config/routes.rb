Rails.application.routes.draw do

  get 'home/index'
  get 'home/test_card'
  get 'home/testdany'
  get 'users/showtest'

  resources :dares, except: [:show, :destroy]
  resources :participations, only: [:create, :update]
  resources :user_send_dares, only: [:create, :update]
  resources :star_dares, only: [:create, :destroy]
  resources :difficulty_ratings, only: [:create]
  resources :comments, only: [:create, :update, :destroy]

  resources :users, only: [:show]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

end