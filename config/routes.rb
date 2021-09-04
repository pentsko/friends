Rails.application.routes.draw do

  devise_for :users
  resources :homeworks
  resources :friends
  resources :posts
  get 'home/about'
  get 'home/contacts'
  get '/posts', to: 'posts#index'
  get '/posts/new', to: 'posts#new'
  get '/posts/:id/edit', to: 'posts#edit'
  get '/posts/id', to: 'posts#update'
  get '/posts/id', to: 'posts#destroy'
  post '/posts', to: 'posts#create'


  # get 'home/index'
  root 'friends#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
