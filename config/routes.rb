Rails.application.routes.draw do
  root "sessions#welcome" # user selects if client or employee

  # routes for client login and signup
  get '/client/login', to: "sessions#client_new"  
  post '/client/login', to: "sessions#client_create"
  get '/client/signup', to: "users#client_new"
  post '/client/signup', to: "users#client_create"

  # routes for employee login and signup
  get '/employee/login', to: "sessions#employee_new"
  post '/employee/login', to: "sessions#employee_create"
  get '/employee/signup', to: "users#employee_new"
  post '/employee/signup', to: "users#employee_create"

  # route for omniauth callback
  get 'auth/github', as: "github_auth"
  match '/auth/:provider/callback', to: 'sessions#omniauth', via: [:get, :post]

  # route for user logout
  post '/logout', to: "sessions#destroy"

  # route for employee search feature
  post 'users/search', to: "users#search", via: :post

  resources :bugs
  resources :users do
    resources :programs, only: [:index]
    resources :bugs, only: [:index]
    resources :tasks
  end
  resources :programs do
    resources :bugs
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
