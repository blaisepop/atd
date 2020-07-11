Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'my_account', to: 'pages#my_account'
  resources :playlists do
    resources :tracks, only: [:new, :create, :edit, :update, :index] do
      member do
        delete 'remove'
      end
    resources :votes, only: [:create]
    end
  end
  get 'playlists_search', to: 'playlists#search'
  #get '/auth/spotify/callback', to: 'users/sessions#spotify'
  devise_scope :user do
    get "/auth/spotify/callback" => "users/sessions#spotify"
    get "/call_spotify" => "users/sessions#call_spotify"
    get "/spotify_connect" => "users/sessions#spotify_connect"
    get "/add_song_to_spotify_playlist" => "users/sessions#add_song_to_spotify_playlist"
  end

end
