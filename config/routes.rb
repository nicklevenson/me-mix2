Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :contents, only: [:show, :destroy]
  resources :mixes
  resources :users do
    resources :mixes
  end
end
