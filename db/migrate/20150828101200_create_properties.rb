class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :property_name
      t.string :property_type
      t.string :room_type
      t.string :location
      t.integer :pax
      t.integer :price
      t.integer :rating
      t.string :property_text
      t.integer :user_id

      t.timestamps null: false
    end
  end
end