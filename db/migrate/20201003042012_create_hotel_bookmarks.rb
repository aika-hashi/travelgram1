class CreateHotelBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :hotel_bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hotel_tweet, null: false, foreign_key: true

      t.timestamps
      t.index [:user_id, :hotel_tweet_id], unique: true # 追加
    end
  end
end
