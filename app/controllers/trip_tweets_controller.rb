class TripTweetsController < ApplicationController
  def new
    @triptweet = TripTweet.new   #「UserDonation」に編集
  end
 
  def create
    @triptweet = TripTweet.new(triptweet_params)   #「UserDonation」に編集
    if @triptweet.save
      redirect_to  root_path
    else
      render :new
  
    end
  end
 
  private
 
  def triptweet_params
   #「投稿者」のキーも追加
   params.require(:trip_tweet).permit(:image,:user_id, :twitter_id,:price, :discount, :age_id, :area_id, :week_id, :crowd_id, :title, :text, :corona_measure, :local, :traffic, :fare).merge( user_id:current_user.id)
  end
end
