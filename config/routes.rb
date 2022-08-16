Rails.application.routes.draw do
  resources :pets
  get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
end
