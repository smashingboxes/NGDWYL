NGDWYL::Application.routes.draw do

  resources :entries, only: [ :create, :show, :index ] do
    get 'random' , on: :collection
  end

  get "/*path", to: redirect("/")
  
  root :to => "static_pages#index"


end
