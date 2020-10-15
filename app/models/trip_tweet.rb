class TripTweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many_attached :images
  belongs_to_active_hash :area
  belongs_to_active_hash :crowd
  belongs_to_active_hash :week
  has_many :trip_tweet_comments
  has_many :trip_bookmarks, dependent: :destroy

  # trip_tweetのお気に入り判定 → vies側で呼び出し
  def bookmark_by?(user)
    trip_bookmarks.where(user_id: user.id).exists?
  end

  validates :area_id, numericality: { other_than: 1 }
  validates :image, :local, :title, :price,:text,presence: true
  #後でimages追加
end
