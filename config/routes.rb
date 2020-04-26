Rails.application.routes.draw do
 
  devise_for :users
  get 'welcome/index'
  resources :articles
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get   '/articles(.:format)',to:          'articles#index'
  get   '/articles/:id(.:format)', to:     'articles#show'
  delete  '/articles/:id(.:format)',to:          'articles#destroy'

  resources :articles do
    resources :comments
  end

  # resources :users

  # resources :sessions
  #   get 'signup' => 'users#new'
  #   get "login"  => "sessions#login"
  #   post "login_attempt"  => "sessions#login_attempt"
  #   get"logout"  => "sessions#logout"
  
end
