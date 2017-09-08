Rails.application.routes.draw do
  devise_for :users
  root to: 'projects#index'
  resources :users, only: [:index]
  resources :users do
    collection do
      post 'change'
    end
  end
end
