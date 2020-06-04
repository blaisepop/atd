class AddSpotifyUriToTracks < ActiveRecord::Migration[6.0]
  def change
    add_column :tracks, :spotify_uri, :string
  end
end
