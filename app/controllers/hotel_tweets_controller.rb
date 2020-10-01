class HotelTweetsController < ApplicationController
  def index
  end
  
  def new
    @hoteltweet = HotelTweet.new   #「UserDonation」に編集
  end
 
  def create
    @hoteltweet = rHotelTweet.new(hoteltweet_params)   #「UserDonation」に編集
   if @hoteltweet.save
    redirect_to  root_path
  else
    render :new

  end
end
 
  private
 
  def hoteltweet_params
   #「投稿者」のキーも追加
   params.require(:hotel_tweet).permit(:price, :discount, :age_id, :area_id, :day_id,:week_id, :crowd_id, :title, :text, :corona_measure, :local, ).merge( user_id:current_user.id)
  end
 

end
