class AddItemCategoryReferenceToItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :items, :categories, column: :item_category_id
    add_index :items, :item_category_id
    change_column_null :items, :item_category_id, false
  end
end
