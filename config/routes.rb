Rails.application.routes.draw do
  devise_for :users
  root to: 'main#index'


  resources :users, only: [:index, :show] do
    collection do
      post 'change'
    end
  end
  resources :projects, has_many: :comments do
    resources :comments
    resources :news_items
    resources :payments
    resources :subscriptions, only: [:new, :create, :destroy]
  end

  resources :news_items, has_many: :comments do
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

  resources :applications
  resources :tags, only: [:index, :show]

  post "/subscriptions/create" => "subscriptions#create"
  delete "/subscriptions/destroy" => "subscriptions#destroy"

  post '/rate' => 'rater#create', :as => 'rate'
  get '/settings', to: 'ui_settings#my_settings'
  get '/my_projects', to: 'projects#my_projects'
  get '/my_news', to: 'news_items#my_news'
end
