Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users do
    resources :posts do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:new, :create]
    end
  end
end
