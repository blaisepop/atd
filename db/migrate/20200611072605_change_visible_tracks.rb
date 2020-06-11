class ChangeVisibleTracks < ActiveRecord::Migration[6.0]
  def change
    rename_column :playlists, :visible_tracks, :seetracks
  end
end
