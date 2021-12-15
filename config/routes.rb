Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create]
      resources :sessions, only: [:index, :create, :destroy]
      post 'users/login', to: 'users#login'
      resources :groups
    end
  end
end
