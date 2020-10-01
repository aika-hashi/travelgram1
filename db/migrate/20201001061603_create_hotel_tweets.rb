class CreateHotelTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :hotel_tweets do |t|
      t.references :user           , foreign_key: true
      t.string :images       , null: false ,default: ""
      t.string :price, null: false
      t.string :discount, null: false
      t.integer :area_id, null: false
      t.integer :day_id, null: false
      t.integer :crowd_id, null: false
      t.integer :week_id, null: false
      t.string  :title, null: false
      t.text  :text, null: false
      t.text  :corona_measure, null: false
      t.string  :local, null: false
      t.timestamps
    end
  end
end
