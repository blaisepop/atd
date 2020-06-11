class ChangeVisible < ActiveRecord::Migration[6.0]
  def change
    rename_column :playlists, :visible, :visible_tracks
  end
end
