Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :posts, except: [:all_posts, :show] do
    resources :comments, only: [:create]
  end

  resources :likes, only: [:create, :destroy]
  resources :friends, only: [:index, :edit, :destroy]
  post 'friends', to: 'friends#add'
  resources :users

  # delete 'users/users/:id', to: 'users#kill_user'
  # delete 'users/:destroy_id', to: 'users#destroy'

  get 'friends_list', to: 'friends#list_friends'

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
