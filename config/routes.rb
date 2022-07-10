Rails.application.routes.draw do
  resources :drops, only: [:create, :show, :destroy]
  resources :users, only: [:show, :create, :update, :destroy]
end
