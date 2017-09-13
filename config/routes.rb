Rails.application.routes.draw do
  devise_for :users
  root to: 'projects#index'
  get '/my_projects', to: 'projects#my_projects'
  resources :users, only: [:index]
  resources :users do
    collection do
      post 'change'
    end
  end
  resources :applications
  resources :projects do
    resources :comments
  end
  resources :payments
  post 'payments/new'

  resources :comments
  resources :projects, has_many: :comments
end
