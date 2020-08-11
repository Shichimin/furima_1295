Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :purchases, only: [:show, :new, :create] 
  end
end