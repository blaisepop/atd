class Track < ApplicationRecord
  has_many :playlist_tracks, dependent: :destroy
  has_many :playlists, through: :playlist_tracks, dependent: :destroy
  has_many :votes, dependent: :destroy
  validates :title, presence: true
end
