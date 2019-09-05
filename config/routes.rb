Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :barges do
    resources :bookings do
      resource :download, only: [:show]
    end
  end

  resources :cargos do
    resources :bookings do
      resource :download, only: [:show]
    end
  end

  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  %w( 404 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
