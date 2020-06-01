class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.string :name
      t.references :dj, null: false, foreign_key: true
      t.string :room_code

      t.timestamps
    end
  end
end
