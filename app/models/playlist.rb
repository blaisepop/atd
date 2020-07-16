class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_tracks, dependent: :destroy
  has_many :tracks, through: :playlist_tracks
  has_many :votes, dependent: :destroy
  validates :name, :date, :room_code, presence: true
  extend FriendlyId
  friendly_id :room_code, use: :slugged

  def generate_code
    room_code_number = nil
    loop do
      room_code_number = rand.to_s[2..8]
      playlist = Playlist.where(room_code: room_code_number).first
      break if playlist.nil?
    end
    self.room_code = room_code_number
  end
end
