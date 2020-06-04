class AddVisibileToPlaylists < ActiveRecord::Migration[6.0]
  def change
    add_column :playlists, :visible, :boolean, default: true
  end
end
