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
  
end
