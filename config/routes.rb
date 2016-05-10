Rails.application.routes.draw do
  
  root 'welcome#welcome'
  get 'welcome/index'
  devise_for :users do
    resources :registered_applications
  end
 
end