class Track < ApplicationRecord
  has_many :playlist_tracks, dependent: :destroy
  has_many :playlists, through: :playlist_tracks, dependent: :destroy
  has_many :votes, dependent: :destroy
  validates :title, presence: true

  def spotify_url
    "https://open.spotify.com/track/#{self.spotify_uri.split(':').last}"
  end

  def youtube_search
    "https://www.youtube.com/results?search_query=#{self.title}+#{self.artist}"
  end

  def votes_number(playlist_id)
    self.votes.where(playlist_id: playlist_id).count
  end
end
