Rails.application.routes.draw do
  
  root 'welcome#welcome'
  get 'welcome/index'
  devise_for :user, :path => "accounts"
  resources :users do
    resources :registered_applications
  end
 
end