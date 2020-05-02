Rails.application.routes.draw do

  #static routes above dynamic routes

  get "/lunches", to:"lunches#index", as:"lunches"
  #we need a get request, the path will be through root / and it'll be handled by the lunches controller by the index method

  get "/lunches/new", to:"lunches#new"
  #renders a new form for create method at /lunches/new

  get "/lunches/:id", to:"lunches#show"

  get "/lunches/:id", to:"lunches#edit"

 

  post "/lunches", to:"lunches#create"

  delete "/lunches", to:"lunches#destroy"

  patch "/lunches/:id", to:"lunches#update"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
