Rails.application.routes.draw do
  root "sessions#welcome"

  get '/client_login', to: "sessions#client_new"
  post '/client_login', to: "sessions#client_create"
  get '/client_signup', to: "users#client_new"
  

  post '/logout', to: "sessions#destroy"
  resources :users
  resources :bugs
  resources :programs do
    resources :bugs
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
