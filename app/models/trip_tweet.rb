class TripTweet < ApplicationRecord
  belongs_to :twitter
  has_many_attached :images
  belongs_to_active_hash :area
  belongs_to_active_hash :crowd
  belongs_to_active_hash :week

  validates :area_id, numericality: { other_than: 1 }
  validates :images,:local, :title, :price,:spot_text,presence: true
end
