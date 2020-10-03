class TripBookmarksController < ApplicationController
  def create
    @triptweet = TripTweet.find(params[:trip_tweet_id])
    bookmark = @triptweet.trip_bookmarks.new(user_id: current_user.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @triptweet = TripTweet.find(params[:trip_tweet_id])
    bookmark = @triptweet.trip_bookmarks.find_by(user_id: current_user.id)
    if bookmark.present?
        bookmark.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
  def show
    @tripbookmark = TripBookmark.all.order("created_at DESC")
  end
end
