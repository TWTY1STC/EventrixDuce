Rails.application.routes.draw do
  
  root 'welcome#welcome'
  get 'welcome/index'
  devise_for :user
  resources :users, only: [] do
    resources :registered_applications
  end
 
end