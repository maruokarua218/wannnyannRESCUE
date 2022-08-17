Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root 'pets#index'
  resources :pets
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
end
