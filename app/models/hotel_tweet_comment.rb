class HotelTweetComment < ApplicationRecord
  belongs_to :hoteltweet  # hoteltweetsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
end
