Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  root to: 'main#index'

  resources :users, only: [:index, :show]
  resources :users do
    collection do
      post 'change'
    end
  end
  resources :applications
  resources :projects do
    resources :comments
    resources :news_items
    resources :payments
  end

  resources :projects do
    resources :news_items
    resources :subscriptions, only: [:new, :create, :destroy]
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
  resources :tags, only: [:index, :show]

  post "/subscriptions/create" => "subscriptions#create"
  delete "/subscriptions/destroy" => "subscriptions#destroy"

  get '/my_projects', to: 'projects#my_projects'
  get '/my_news', to: 'news_items#my_news'
end
