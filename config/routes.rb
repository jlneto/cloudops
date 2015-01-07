Rails.application.routes.draw do

  get 'home/index'

  resources :apps
  resources :app_components

  resources :instances
  resources :instance_components

  resources :jobs do
    get :run, :on => :member
    get :execute, :on => :collection
    get :job_output, :on => :member
    get :job_finished, :on => :member
  end

  root to: 'home#index'

  devise_for :users
  resources :users

end
