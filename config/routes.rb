Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  
  ## The routes are related to the URL
  ## resources :articles -> create all routes for 'articles'
  ## This is a short hand
  ## REST - Representational state transfer - mapping HTTP verbs (get, post, put/patch, delete)
  ## to CRUD actions
  resources :articles
  ## Use 'only:' to limit the generated routes
  ##resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]

  get "signup", to: "users#new"
  ## post "users", to: "user#create"

  ## This creates all the CRUD operations, except new because it has already been defined
  resources :users, except: [:new]

  # .../login
  get "login", to: "sessions#new"

  # Create request
  post "login", to: "sessions#create"

  delete "logout", to: "sessions#destroy"
  
end
