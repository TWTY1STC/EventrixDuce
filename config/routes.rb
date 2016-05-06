Rails.application.routes.draw do
  
  root 'welcome#welcome'
  get 'welcome/index'
  devise_for :users
 
end