require 'rspotify'
class Users::SessionsController < Devise::SessionsController
  def call_spotify
    current_user.temp_playlist_id = params[:playlist_id].to_i
    current_user.save
    redirect_to '/auth/spotify'
  end

  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @playlist = Playlist.find(current_user.temp_playlist_id)
    @spotify_playlist = @spotify_user.create_playlist!(@playlist.name)
    # Now you can access user's private data, create playlists and much more
    # Access private data
    # spotify_user.country #=> "US"
    # spotify_user.email   #=> "example@email.com"
    # Create playlist in user's Spotify account
    # Add tracks to a playlist in user's Spotify account
    #@tracks = RSpotify::Track.search('Know')

    get_tracks = @playlist.tracks.map{|track|track.spotify_uri}
    @spotify_playlist.add_tracks!(get_tracks)

    # get_tracks.each do |track|
    #   @spotify_playlist.add_tracks!(track)
    # end

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
    redirect_to playlists_path
  # private

  # def sessions_params
  #   params.permit(:playlist_name)
  # end
  end
end
