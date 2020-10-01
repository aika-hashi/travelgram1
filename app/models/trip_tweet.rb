class TripTweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :area
  belongs_to_active_hash :crowd
  belongs_to_active_hash :week

  validates :area_id, numericality: { other_than: 1 }
  validates :image, :local, :title, :price,:text,presence: true
  #後でimages追加
end
