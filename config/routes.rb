Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :ideas

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :categories
  end
end
