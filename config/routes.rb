Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :content, only: [:show]
  
  resources :mixes
  resources :users
end
