class HotelTweetCommentsController < ApplicationController
  def create
    
    hoteltweetcomment = HotelTweetComment.create(hoteltweetcomment_params)
    redirect_to "/hotel_tweets/#{hoteltweetcomment.hotel_tweet_id}"  # コメントと結びつくツイートの詳細画面に遷移する
  end
   
  private
  def hoteltweetcomment_params
    params.require(:hotel_tweet_comment).permit(:text).merge(user_id: current_user.id, hotel_tweet_id: params[:hotel_tweet_id])
  end
end
