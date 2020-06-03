Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :playlists do
    resources :tracks, only: [:new, :create, :edit, :update, :index] do
      member do
        delete 'remove'
      end
      resources :votes, only: [:create]
    end
  end
  get 'playlists_search', to: 'playlists#search'
end
