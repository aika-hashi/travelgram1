class TripTweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many_attached :images
  belongs_to_active_hash :area
  belongs_to_active_hash :crowd
  belongs_to_active_hash :week
  has_many :trip_tweet_comments

  validates :area_id, numericality: { other_than: 1 }
  validates :images, :local, :title, :price,:text,presence: true
  #後でimages追加
end
