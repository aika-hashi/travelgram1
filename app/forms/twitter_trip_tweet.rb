class TwitterTripTweet

  include ActiveModel::Model
  attr_accessor :user_id, :twitter_id,:price, :discount, :age_id, :area_id, :week_id, :crowd_id, :title, :text, :corona_measure, :local, :traffic, :fare

  validates :area_id, numericality: { other_than: 1 }
  validates :images,:local, :title, :price,:spot_text,presence: true

  def save
    # 投稿者の情報を保存し、「twitter」という変数に入れている
    twitter = twitter.create(user_id: user_id, hotel_tweet_id: hotel_tweet_id)
    # 観光スポットの投稿情報を保存
    TripTweet.create(price: price, discount: discount, age_id: age_id, area_id: area_id, week_id: week_id, crowd_id: crowd_id, title: title, text: text, corona_measure: corona_measure, local: local, traffic: traffic, fare: fare, twitter_id: twitter.id)
  end

end