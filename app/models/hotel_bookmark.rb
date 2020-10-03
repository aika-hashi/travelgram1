class HotelBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :hotel_tweet

  validates :user_id, uniqueness: { scope: :hotel_tweet_id } # 追加
end
