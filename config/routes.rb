Rails.application.routes.draw do

  get 'ccde/show'
  get 'ccde/execute'
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

  root to: 'ccde#show'

  devise_for :users
  resources :users

end
