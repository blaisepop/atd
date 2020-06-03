class Track < ApplicationRecord
  has_many :playlists, through: :playlist_tracks
  has_many :playlist_tracks
  has_many :votes
  belongs_to :user
end
