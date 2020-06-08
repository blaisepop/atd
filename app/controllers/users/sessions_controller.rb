# frozen_string_literal: true
require 'rspotify'

class Users::SessionsController < Devise::SessionsController

 def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @spotify_playlist = @spotify_user.create_playlist!('My new playlist')
    # Now you can access user's private data, create playlists and much more

    # Access private data
    # spotify_user.country #=> "US"
    # spotify_user.email   #=> "example@email.com"

    # Create playlist in user's Spotify account


    # Add tracks to a playlist in user's Spotify account
     @tracks = RSpotify::Track.search('Know')
     @spotify_playlist.add_tracks!(@tracks)
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
    redirect_to playlist_path(4)
  end

end
