Rails.application.routes.draw do
  
  root 'welcome#welcome'
  get 'welcome/index'
  devise_for :user
  resources :users, only: [] do
    resources :registered_applications
  end
 
  namespace :api, defaults: {format: :json} do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end
end