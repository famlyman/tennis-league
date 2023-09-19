Rails.application.routes.draw do
  resources :matches
  resources :leagues
  resources :seasons
  resources :teams
  root 'pages#home'
  devise_for :players, controllers: {
    sessions: 'players/sessions',
    registrations: 'players/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
