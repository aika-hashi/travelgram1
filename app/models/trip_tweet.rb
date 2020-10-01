class TripTweet < ApplicationRecord
  belongs_to :twitter
  has_many_attached :images
  belongs_to_active_hash :area
  belongs_to_active_hash :crowd
  belongs_to_active_hash :week
end
