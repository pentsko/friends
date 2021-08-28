Rails.application.routes.draw do
  devise_for :users
  resources :homeworks
  resources :friends
  get 'home/about'
  get 'home/contacts'

  # get 'home/index'
  root 'friends#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
