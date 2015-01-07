Rails.application.routes.draw do
  resources :jobs

  get 'home/index'

  resources :app_components

  resources :instance_components

  resources :instances

  resources :apps

  root to: 'home#index'
  devise_for :users
  resources :users
end
