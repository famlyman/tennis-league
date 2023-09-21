Rails.application.routes.draw do
  resources :matches do
    collection do
      post :mens_doubles
      post :womens_doubles
      post :mixed_doubles
      post :mens_singles
      post :womens_singles
    end
  end
  resources :leagues
  resources :seasons
  resources :teams do
    post 'join', on: :member
    delete 'leave', on: :member
  end
  root 'pages#home'
  devise_for :players, controllers: {
    sessions: 'players/sessions',
    registrations: 'players/registrations'
  }
 
end
