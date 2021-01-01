Rails.application.routes.draw do
  devise_for :users
  root to: "goals#index"
  resources :goals
  
  namespace :admin do
    resources :users, only: [:index]
  end
  
end
