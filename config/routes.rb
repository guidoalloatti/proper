Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'

  get 'home', :to => 'home#index'
  get '/images/:filename', to: 'home#image', as: 'image'
  post "remove_images" => "home#remove_images"
  post "remove_image" => "home#remove_image"
  post "download" => "home#download"
end
