Rails.application.routes.draw do

  devise_for :users
  resources :homeworks
  resources :friends, only: [:create]
  resources :posts, except: [:all_posts, :show]

  get 'friends/users', to: 'friends#users'
  get 'friends_list', to: 'friends#list_friends'

  delete 'friends/:destroy_id', to: 'friends#destroy'
  get 'home/about'
  get 'home/contacts'
  get 'posts/all_posts', to: 'posts#all_posts'
  get '/posts/:id', to: 'posts#show'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
