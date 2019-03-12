Rails.application.routes.draw do

  get 'home/index'
  get 'home/test_card'

  resources :dares
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

end
