Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :playlists do
    resources :tracks, only: [:destroy, :new, :create, :edit, :update, :index] do
      resources :votes, only: [:create]
    end
  end
  get 'playlists_search', to: 'playlists#search'
end
