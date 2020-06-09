class AddTempPlaylistIdtoUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :temp_playlist_id, :integer
  end
end
