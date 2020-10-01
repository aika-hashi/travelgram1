class TwittersController < ApplicationController
  def new
    @hoteltweet = TwitterHotelTweet.new   #「UserDonation」に編集
  end
 
  def create
    @hoteltweet = TwitterHotelTweet.new(hoteltweet_params)   #「UserDonation」に編集
    @hoteltweet.save
  end
 
  private
 
  def hoteltweet_params
   #「投稿者」のキーも追加
   params.require(:twitter_hotel_tweet).permit(:user_id, :twitter_id,:price, :discount, :age_id, :area_id, :day_id,:week_id, :crowd_id, :title, :text, :corona_measure, :local, )
  end
 

end
