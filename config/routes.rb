Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #

  jsonapi_resources :pages
  jsonapi_resources :tags
end
