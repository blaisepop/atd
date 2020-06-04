class Vote < ApplicationRecord
  belongs_to :track, counter_cache: true
  belongs_to :playlist
end
