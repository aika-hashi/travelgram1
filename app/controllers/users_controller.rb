class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @hoteltweets = HotelTweet.all.order("created_at DESC")
    @triptweets = TripTweet.all.order("created_at DESC")
  
    # @hoteltweet = HotelTweet.find(params[:id])
    # @triptweet = TripTweet.find(params[:id])
    
    #  if user_signed_in? 
    #   redirect_to user_path(current_user.id)
    # else
    #   render root_path
    # end    
  
  end
  

  private

  def user_params
    params.require(:user).permit(:nickname,:email,:password,:password_confirmation,:firstname, :familyname, :firstname_kana, :familyname_kana, :date)
  end
end
