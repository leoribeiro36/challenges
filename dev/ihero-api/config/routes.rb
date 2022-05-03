Rails.application.routes.draw do
  resources :users
  resources :heroes

  post 'authenticate', to: 'authentication#authenticate'
  post 'event', to: 'events#register'
  get 'events', to: 'events#show'

end
