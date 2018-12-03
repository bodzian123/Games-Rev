Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  resources :games do
    resources :comments
  end

  resources :movies do
    resources :comentages
  end

  resources :musics do
    resources :opinions
  end

  resources :users do
    resources :games
    resources :movies
    resources :musics
  end

  root 'home#index'
end
