class CreateTripBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :trip_bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :trip_tweet, null: false, foreign_key: true

      t.timestamps
      t.index [:user_id, :trip_tweet_id], unique: true # 追加
    end
  end
end
