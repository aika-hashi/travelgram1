class HotelTweetsController < ApplicationController
  def index
    # @tweets = Tweet.all.order("created_at DESC")
    # @trips = Trip.all.order("created_at DESC")

    @search = HotelTweet.ransack(params[:q])
    @hoteltweet = @search.result(distinct: true).order("created_at DESC")


    @searchs = TripTweet.ransack(params[:q])
    @triptweet = @searchs.result(distinct: true).order("created_at DESC")
    

    @hoteltweets = HotelTweet.all.includes(:user)
    # @trips = Trip.all.includes(:user)
    #  @user = User.find(params[:id])
  end
  
  def new
    @hoteltweet = HotelTweet.new   #「UserDonation」に編集
  end
 
  def create
    @hoteltweet = HotelTweet.new(hoteltweet_params)   #「UserDonation」に編集
  if @hoteltweet.save
   redirect_to  root_path
  else
    render :new

  end
end

def show
  @hoteltweet = HotelTweet.find(params[:id])
  @hoteltweets = HotelTweet.all.includes(:user)
  # @comment = Comment.new
  # @comments = @tweet.comments.includes(:user)
  # @trip = Trip.find(params[:id])
end


def edit
  @hoteltweet = HotelTweet.find(params[:id])

end

def update
  @hoteltweet = HotelTweet.find(params[:id])
  if @hoteltweet.update(hoteltweet_params)
    redirect_to hoteltweet_path(@hoteltweet)
  else
    render :edit
  end
end
 
 

def destroy
  @hoteltweet = HotelTweet.find(params[:id])
  if @hoteltweet.destroy
    redirect_to root_path
  end
end

 
  private
 
  def hoteltweet_params
   #「投稿者」のキーも追加
   params.require(:hotel_tweet).permit(:image,:price, :discount, :agency_id, :area_id, :day_id,:week_id, :crowd_id, :title, :text, :corona_measure, :local, ).merge( user_id:current_user.id)
  end
 

end
