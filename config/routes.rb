NGDWYL::Application.routes.draw do

  resources :entries

  get "/*path", to: redirect("/")
  
  root :to => "static_pages#index"


end
