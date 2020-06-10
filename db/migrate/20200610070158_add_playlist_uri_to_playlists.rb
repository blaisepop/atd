class AddPlaylistUriToPlaylists < ActiveRecord::Migration[6.0]
  def change
    add_column :playlists, :playlist_uri, :string
  end
end
