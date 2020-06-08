class AddDateToPlaylist < ActiveRecord::Migration[6.0]
  def change
    add_column :playlists, :date, :date
  end
end
