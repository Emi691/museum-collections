Rails.application.routes.draw do
  resources :pieces do
    resources :treatments, only: [:show, :index, :new]
  end

  resources :user, only: [:show] do
    resources :pieces, only [:index, :show]
  end

  get "/", to: "application#home"

  get "/signup", to: "users#new"
  post '/signup', to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#logout"

  get '/auth/google_oauth2/callback', to: 'sessions#create_from_google'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
