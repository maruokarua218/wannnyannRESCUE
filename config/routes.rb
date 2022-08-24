Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root 'pets#index'
  post 'guest_login', to: "guest_sessions#create"
  post 'admin_guest_login', to: "admin_guest_sessions#create"
  resources :sessions, only: [:new, :create, :destroy]
  resources :pets do
    collection do
      get 'search'
    end
  end
  get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :favorites, only: [:create, :destroy, :index]
  resources :relationships, only: [:create, :destroy]
  resources :conversations do
  resources :messages
  end
  namespace :admin do
   resources :users
  end
end
