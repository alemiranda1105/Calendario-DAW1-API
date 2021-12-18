Rails.application.routes.draw do
  root 'homepage#index'
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :show]
      resources :sessions, only: [:index, :create, :destroy]
      post 'users/login', to: 'users#login'
      post 'users/add_friend', to: 'users#add_friend'
      resources :groups, only: [:index, :show]
      resources :event, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
