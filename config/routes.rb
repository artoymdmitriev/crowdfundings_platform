Rails.application.routes.draw do
  devise_for :users
  root to: 'main#index'
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
    resources :news_items
  end

  resources :projects do
    resources :news_items
  end

  resources :news_items do
    resources :comments
  end

  shallow do
    resources :users do
      resources :applications do
        member do
          get 'check'
        end
      end
    end
  end

  resources :payments
  post 'payments/new'

  resources :comments
  resources :projects, has_many: :comments
  resources :news_items
  get '/settings', to: 'ui_settings#my_settings'
end
