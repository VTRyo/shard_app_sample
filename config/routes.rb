Rails.application.routes.draw do
  # get 'items/new'
  # get 'items/create'
  # get 'items/index'
  # get 'items/destroy'
  # get 'offices/new'
  # get 'offices/create'
  # get 'offices/index'
  # get 'offices/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :offices
  resources :items
end
