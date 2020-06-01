class Playlist < ApplicationRecord
  belongs_to :dj
  has_many :tracks
end
