Rails.application.routes.draw do

  post 'entries/create', to: 'entries#create'
  post 'entries/verify', to: 'entries#verify'
  post 'entries/random', to: 'entries#random'


  post 'users/create', to: 'users#create'
  post 'users/login', to: 'users#login'
  post 'users/auth', to: 'users#authenticate'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
