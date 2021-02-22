Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#index'
  resources :homes do
    resources :comments, only: :create
  end
end