Rails.application.routes.draw do
  root "sessions#welcome"

  get '/client_login', to: "sessions#client_new"
  get '/client_signup', to: "users#client_new"
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  resources :users
  resources :bugs
  resources :programs do
    resources :bugs
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
