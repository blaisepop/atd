class DropFriendlyIdSlugsTable < ActiveRecord::Migration[6.0]
  def change
    def up
    drop_table :friendly_id_slugs
    end

    def down
    fail ActiveRecord::IrreversibleMigration
    end
  end
end
