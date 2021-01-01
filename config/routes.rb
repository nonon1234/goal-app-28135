Rails.application.routes.draw do
  devise_for :users
  root to: "goals#index"
  resources :goals, only: [:index, :new, :create, :show]
  
  namespace :admin do
    resources :users, only: [:index]
  end
  
end
