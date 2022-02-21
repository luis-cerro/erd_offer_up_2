class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_description
      t.integer :item_status_id
      t.string :item_title
      t.integer :item_category_id
      t.string :item_location
      t.integer :owner_id
      t.string :price

      t.timestamps
    end
  end
end
