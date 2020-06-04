class AddVotesToTracks < ActiveRecord::Migration[6.0]
  def change
    add_column :tracks, :votes_count, :integer, default: true
      Track.reset_column_information
      Track.all.each do |track|
        Track.reset_counters(track.id, :votes)
      end
  end
end
