class RenameUsersToGuests < ActiveRecord::Migration[6.0]
  def change
    rename_column :votes, :user_id, :guest_id
  end
end
