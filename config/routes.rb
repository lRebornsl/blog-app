Rails.application.routes.draw do
  resources :users do
    get 'posts', to: 'posts#index', on: :member, as: 'posts'
    get 'posts/:id', to: 'posts#show', on: :member, as: 'post'
  end
  
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
end
