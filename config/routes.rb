Rails.application.routes.draw do

  devise_for :users
  resources :homeworks
  resources :friends
  resources :posts
  get 'home/about'
  get 'home/contacts'
  get 'home/posts', to: 'posts#index'
  get 'home/posts/new', to: 'posts#new'
  post '/posts', to: 'posts#create'

  # get 'home/index'
  root 'friends#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
