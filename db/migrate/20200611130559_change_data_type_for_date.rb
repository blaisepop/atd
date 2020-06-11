class ChangeDataTypeForDate < ActiveRecord::Migration[6.0]
  def change
    change_column :playlists, :date, :datetime
  end
end
