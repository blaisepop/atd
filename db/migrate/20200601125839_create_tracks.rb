class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.string :artist
      t.string :title
      t.string :album
      t.integer :duration
      t.integer :votes

      t.timestamps
    end
  end
end
