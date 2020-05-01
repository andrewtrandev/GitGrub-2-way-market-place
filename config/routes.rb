Rails.application.routes.draw do

  get "/lunches", to:"lunches#index" 
  #we need a get request, the path will be through root / and it'll be handled by the lunches controller by the index method

  get "/lunches/:id", to:"lunches#show"

  post "/lunches", to:"lunches#create"

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
