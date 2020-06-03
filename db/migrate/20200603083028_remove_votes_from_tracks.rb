class RemoveVotesFromTracks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tracks, :votes
  end
end
