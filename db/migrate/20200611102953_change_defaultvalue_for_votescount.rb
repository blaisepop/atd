class ChangeDefaultvalueForVotescount < ActiveRecord::Migration[6.0]
  def change
    change_column_default :tracks, :votes_count, from: 1, to: 0
  end
end
