Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'projects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'blablabla', to: 'projects#index'
end
