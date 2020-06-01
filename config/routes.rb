Rails.application.routes.draw do
  get 'playlists/index'
  get 'playlists/create'
  get 'playlists/update'
  get 'playlists/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :playlists do
    resources :tracks, only: [:destroy, :new, :create, :edit, :update, :index]
  end

end
