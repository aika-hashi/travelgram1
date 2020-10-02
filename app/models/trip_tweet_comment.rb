class TripTweetComment < ApplicationRecord
  belongs_to :trip_tweet  # trip_tweetsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
end
