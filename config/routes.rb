Rails.application.routes.draw do
  root to: 'images#index'
  resources :uploads
  resources :images
  post 'images/compress', to: 'images#create'
  get 'images/:uuid/download', to: 'images#download'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
