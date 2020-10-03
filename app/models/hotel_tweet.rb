class HotelTweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many_attached :images
  belongs_to_active_hash :area
  belongs_to_active_hash :crowd
  belongs_to_active_hash :day
  belongs_to_active_hash :week
  belongs_to_active_hash :agency
  has_many :hotel_tweet_comments
  has_many :hotel_bookmarks, dependent: :destroy

  # hotel_tweetのお気に入り判定 → vies側で呼び出し
  def bookmark_by?(user)
    hotel_bookmarks.where(user_id: user.id).exists?
  end
  
  
  validates :area_id, numericality: { other_than: 1 }
  validates :images, :local, :title, :price,:text,presence: true
#後でimages追加

end

