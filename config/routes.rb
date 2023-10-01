Rails.application.routes.draw do
  resources :users do
    resources :posts do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:new, :create]
    end
  end
end
