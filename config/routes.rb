Rails.application.routes.draw do

  get 'home/index'
  get 'home/test_card'
  get 'home/testdany'

  resources :dares
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

end