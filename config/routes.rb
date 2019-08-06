Rails.application.routes.draw do
  devise_for :users

  get 'home/index'

  get 'home/games'
  get 'home/movies'
  get 'home/musics'

  scope "/user" do
    resources :users do
      resources :games
      resources :movies
      resources :musics
    end
  end

  resources :games do
    resources :comments
  end

  resources :movies do
    resources :comentages
  end

  resources :musics do
    resources :opinions
  end

  root 'home#index'
end
