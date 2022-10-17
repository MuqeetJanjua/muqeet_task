Rails.application.routes.draw do
  root :to => 'home#index'
  get '/products', :to => 'products#index'
  get '/products_list', :to => 'products#products'
  post '/create_product', :to => 'products#create_products'
  mount ShopifyApp::Engine, at: '/'
  get 'home/index' => 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
