class CreatePropertyTags < ActiveRecord::Migration
  def change
    create_table :property_tags do |t|
      t.string :tag_text
      t.integer :proprety_id
      t.integer :user_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end

