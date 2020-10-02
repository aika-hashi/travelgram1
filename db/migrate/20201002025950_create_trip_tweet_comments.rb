class CreateTripTweetComments < ActiveRecord::Migration[6.0]
  def change
    create_table :trip_tweet_comments do |t|
      t.integer :user_id
      t.integer :trip_tweet_id
      t.text :text
      t.timestamps
    end
  end
end
