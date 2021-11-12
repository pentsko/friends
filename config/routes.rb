Rails.application.routes.draw do
  devise_for :users
  resources :posts, except: [:all_posts, :show] do
    resources :comments, only: [:create]
  end

  resources :likes, only: [:create, :destroy]
  resources :friends, only: [:create, :edit]
  # resources :users
  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new'
  post '/users/new', to: 'users#create_user'
  delete 'users/users/:id', to: 'users#kill_user'
  get 'users/users', to: 'users#users'
  delete 'users/:destroy_id', to: 'users#destroy'

  get 'friends_list', to: 'users#list_friends'

  get 'posts/all_posts', to: 'posts#all_posts'
  get '/posts/:id', to: 'posts#show'

  get 'home/about'
  get 'home/contacts'
  get 'posts/all_posts', to: 'posts#all_posts'
  get '/posts/:id', to: 'posts#show'
  get 'search', to: 'posts#search'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
