class CreateHotelTweetComments < ActiveRecord::Migration[6.0]
  def change
    create_table :hotel_tweet_comments do |t|
      t.integer :user_id
      t.integer :hotel_tweet_id
      t.text :text
      t.timestamps
    end
  end
end
