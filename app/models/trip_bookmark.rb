class TripBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :trip_tweet
validates :user_id, uniqueness: { scope: :trip_tweet_id } # 追加
end
