class AddSubmissionsToPlaylists < ActiveRecord::Migration[6.0]
  def change
    add_column :playlists, :submission, :boolean, default: true
  end
end
