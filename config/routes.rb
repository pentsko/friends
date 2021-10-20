Rails.application.routes.draw do

  devise_for :users
  resources :homeworks
  resources :friends, only: [:create]
  resources :posts

  get 'friends/users', to: 'friends#users'
  get 'friends_list', to: 'friends#list_friends'
  delete 'friends/:destroy_id', to: 'friends#destroy'
  get 'home/about'
  get 'home/contacts'

  root 'posts#all_posts'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
