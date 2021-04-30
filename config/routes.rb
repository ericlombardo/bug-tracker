Rails.application.routes.draw do
  root "sessions#welcome" # user selects if client or employee

  # routes for client login and signup
  get '/client/login', to: "sessions#client_new"  
  post '/client/login', to: "sessions#client_create"
  get '/client/signup', to: "users#client_new"
  post'/client/signup', to: "users#client_create"
  
  # routes for employee login and signup
  get '/employee/login', to: "sessions#employee_new"
  post '/employee/login', to: "sessions#employee_create"
  get '/employee/signup', to: "users#employee_new"
  post '/employee/signup', to: "users#employee_create"

  post '/logout', to: "sessions#destroy"
  resources :bugs
  resources :users do
    resources :programs, only: [:index]
    resources :bugs, only: [:index]
  end
  resources :programs do
    resources :bugs
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
