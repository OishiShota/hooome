Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#index'
  resources :homes do
    resources :messages, only: :create
  end
end