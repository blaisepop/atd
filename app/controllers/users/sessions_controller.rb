require 'rspotify'
class Users::SessionsController < Devise::SessionsController
  def call_spotify
    current_user.temp_playlist_id = params[:playlist_id].to_i
    current_user.save
    redirect_to '/auth/spotify'
  end

  def spotify_connect
    @spot_logged_user = session[:spotify_hash].RSpotify::User.new(request.env['omniauth.auth']).to_hash
    @spotify_username = session[:spotify_hash]["display_name"]
  end

  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @playlist = Playlist.find(current_user.temp_playlist_id)
    @spotify_playlist = @spotify_user.create_playlist!(@playlist.name)
    @playlist_uri = @spotify_playlist.uri
    # Now you can access user's private data, create playlists and much more
    # Access private data
    # spotify_user.country #=> "US"
    # spotify_user.email   #=> "example@email.com"
    # Create playlist in user's Spotify account

    #@tracks = RSpotify::Track.search('Know')

    get_tracks = @playlist.tracks.map{|track|track.spotify_uri}
    @spotify_playlist.add_tracks!(get_tracks)

    @playlist.playlist_uri = @playlist_uri
    @playlist.save
    session[:spotify_hash] = @spotify_user.to_hash

    #@spotify_playlist.add_tracks!(@tracks)
    # @spotify_playlist.tracks.first.name #=> "Somebody That I Used To Know"
    # Access and modify user's music library
    # spotify_user.save_tracks!(@tracks)
    # spotify_user.saved_tracks.size #=> 20
    # spotify_user.remove_tracks!(@tracks)

    # albums = RSpotify::Album.search('launeddas')
    # spotify_user.save_albums!(albums)
    # spotify_user.saved_albums.size #=> 10
    # spotify_user.remove_albums!(albums)

    # Use Spotify Follow features
    # spotify_user.follow(playlist)
    # spotify_user.follows?(artists)
    # spotify_user.unfollow(users)

    # Get user's top played artists and tracks
    # spotify_user.top_artists #=> (Artist array)
    # spotify_user.top_tracks(time_range: 'short_term') #=> (Track array)
    redirect_to playlist_path(current_user.temp_playlist_id)
  # private

  # def sessions_params
  #   params.permit(:playlist_name)
  # end
  end

  def add_song_to_spotify_playlist
    @playlist_id = params[:playlist_uri].split(':').last
    @spotify_playlist = RSpotify::Playlist.find(session[:display_name], @playlist_id)
    @track_uri = params[:track_uri]
    @spotify_playlist.add_tracks!([@track_uri])
    redirect_to playlist_path(current_user.temp_playlist_id)
  end
end
