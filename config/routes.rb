Rails.application.routes.draw do
  resources :tickets
  resources :contacts
  resources :meetings
  resources :clients
  resources :users
  post 'authenticate', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
