class CreateProperty < ActiveRecord::Migration
  def change
    create_table :propertys do |t|
      t.string :property_type
      t.string :room_type
      t.string :location
      t.integer :pax
      t.integer :price
      t.integer :rating
      t.string :property_text

      t.timestamps null: false
    end
  end
end