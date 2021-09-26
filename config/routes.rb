Rails.application.routes.draw do

  devise_for :users
  resources :homeworks
  resources :friends, only: [:create]
  resources :posts

  get 'friends/users', to: 'friends#users'
  get 'friends_list', to: 'friends#list_friends'
  delete 'friends/:destroy_id', to: 'friends#destroy'
  # get 'user_posts', to: 'posts#index'
  get 'home/about'
  get 'home/contacts'
  # get 'posts', to: 'posts#all_posts'
  # get '/posts/new', to: 'posts#new'
  # get '/posts/:id/edit', to: 'posts#edit'
  # get '/posts/id', to: 'posts#update'
  # get '/posts/id', to: 'posts#destroy'
  # post '/posts', to: 'posts#create'


  # get 'home/index'
  root 'home#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
