Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products do
    resources :bookings, only: [:new, :create]
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  get 'dashboard', to: 'pages#dashboard'
  post '/booking_accept/:id', to: 'bookings#accept', as: 'booking_accept'
  post '/booking_decline/:id', to: 'bookings#decline', as: 'booking_decline'
end
