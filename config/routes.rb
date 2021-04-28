Rails.application.routes.draw do
  root "sessions#welcome" # user selects if client or employee

  # routes for client login and signup
  get '/client_login', to: "sessions#client_new"  
  post '/client_login', to: "sessions#client_create"
  get '/client_signup', to: "users#client_new"
  post'/client_signup', to: "users#client_create"
  
  # routes for employee login and signup
  get '/employee_login', to: "sessions#employee_new"
  post '/employee_login', to: "sessions#employee_create"
  get '/employee_signup', to: "users#employee_new"
  post '/employee_signup', to: "users#employee_create"

  post '/logout', to: "sessions#destroy"
  resources :users
  resources :bugs
  resources :programs do
    resources :bugs
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
