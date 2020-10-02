class TripTweetComment < ApplicationRecord
  belongs_to :triptweet  # triptweetsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
end
