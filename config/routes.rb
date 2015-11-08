Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :ideas do
    resources :images
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :categories
    resources :images
  end

end
