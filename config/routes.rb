Rails.application.routes.draw do

  get 'ccde/setup'
  get 'ccde/status'
  get 'ccde/update'
  get 'home/index'

  resources :apps do
    resources :app_components
  end

  resources :instances do
    resources :instance_components
  end

  resources :jobs do
    get :run, :on => :member
    get :execute, :on => :collection
    get :job_output, :on => :member
    get :job_finished, :on => :member
  end

  root to: 'ccde#status'

  devise_for :users
  resources :users

end
