Rails.application.routes.draw do
  root 'pets#index'
  resources :pets
  get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
end
