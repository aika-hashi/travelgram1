class CreateTwitters < ActiveRecord::Migration[6.0]
  def change
    create_table :twitters do |t|
      t.references :user           , foreign_key: true
      
      t.timestamps
    end
  end
end
