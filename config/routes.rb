Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :posts, except: [:all_posts, :show] do
    resources :comments, only: [:create]
  end

  resources :likes, only: [:create, :destroy]
  resources :friends, only: [:index, :edit]
  get 'list_users', to: 'friends#list_users'
  get 'friends_list', to: 'friends#list_friends'
  post 'friends', to: 'friends#add'
  delete 'friends/:destroy_id', to: 'friends#destroy_friendship'
  delete 'user/:id', to: 'friends#destroy_specific_user'
  get '/user/:id', to: 'friends#show'

  get 'posts/all_posts', to: 'posts#all_posts'
  get '/posts/:id', to: 'posts#show'
  get 'search', to: 'posts#search'

  get 'home/about'
  get 'home/contacts'

  root 'home#index'
end
