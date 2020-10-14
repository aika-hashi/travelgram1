class HotelBookmarksController < ApplicationController
  def create
    @hoteltweet = HotelTweet.find(params[:hotel_tweet_id])
    bookmark = @hoteltweet.hotel_bookmarks.new(user_id: current_user.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @hoteltweet = HotelTweet.find(params[:hotel_tweet_id])
    bookmark = @hoteltweet.hotel_bookmarks.find_by(user_id: current_user.id)
    if bookmark.present?
        bookmark.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
  def show
    @hotelbookmark = HotelBookmark.where(user_id: current_user.id).order("created_at DESC")
  end
end
