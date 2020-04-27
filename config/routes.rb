Rails.application.routes.draw do
  resources :posts
  resources :items
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
  get '/items/:id(.:format)', to: 'items#show'
end
