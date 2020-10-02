class TripTweetCommentsController < ApplicationController
  def create
  
   triptweetcomment = TripTweetComment.create(triptweetcomment_params)
    redirect_to "/trip_tweets/#{triptweetcomment.trip_tweet_id}"  # コメントと結びつくツイートの詳細画面に遷移する
  
end
   
  private
  def triptweetcomment_params
    params.require(:trip_tweet_comment).permit(:text).merge(user_id: current_user.id, trip_tweet_id: params[:trip_tweet_id])
  end
end
