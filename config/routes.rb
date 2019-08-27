Rails.application.routes.draw do

  devise_for :users

  get 'bookings/show'
  get 'barges/index'
  get 'barges/new'
  get 'barges/create'
  get 'cargos/index'
  get 'cargos/new'
  get 'cargos/create'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
