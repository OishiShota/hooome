Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#index'
  resources :homes, except: [:destroy, :update] do
    resources :messages, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end