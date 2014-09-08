NGDWYL::Application.routes.draw do
  root :to => "static_pages#index"

  resources :entries

end
