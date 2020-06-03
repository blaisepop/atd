class AddGuestidToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :guest_id, :string
  end
end
