class CreateHotelRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :hotel_relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
  end
end
