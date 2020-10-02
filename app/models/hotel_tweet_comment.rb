class HotelTweetComment < ApplicationRecord
  belongs_to :hotel_tweet  # hotel_tweetsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
end
