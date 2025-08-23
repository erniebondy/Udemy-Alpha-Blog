Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  
  ## The routes are related to the URL
  ## resources :articles -> create all routes for 'articles'
  ## Use 'only:' to limit the generated routes
  resources :articles, only: [:show, :index]
  
end
