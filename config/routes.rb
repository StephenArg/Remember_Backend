Rails.application.routes.draw do

  post 'entries/edit', to: 'entries#edit'
  post 'entries/create', to: 'entries#create'
  post 'entries/delete', to: 'entries#delete'
  post 'entries/verify', to: 'entries#verify'
  post 'entries/skip', to: 'entries#skip'
  post 'entries/random', to: 'entries#random'
  post 'entries/backup', to: 'entries#backup'
  post 'entries/restore', to: 'entries#restore'
  post 'entries/search', to: 'entries#search'


  post 'users/create', to: 'users#create'
  post 'users/login', to: 'users#login'
  post 'users/auth', to: 'users#authenticate'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
