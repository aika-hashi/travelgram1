class TripTweetsController < ApplicationController
  def new
    @triptweet = TwitterTripTweet.new   #「UserDonation」に編集
  end
 
  def create
    @triptweet = TwitterTripTweet.new(triptweet_params)   #「UserDonation」に編集
    @triptweet.save
  end
 
  private
 
  def triptweet_params
   #「投稿者」のキーも追加
   params.require(:twitter_trip_tweet).permit(:user_id, :twitter_id,:price, :discount, :age_id, :area_id, :week_id, :crowd_id, :title, :text, :corona_measure, :local, :traffic, :fare)
  end
end
