class RemoveGuestsFromVotes < ActiveRecord::Migration[6.0]
  def change
    remove_reference :votes, :guest
  end
end
