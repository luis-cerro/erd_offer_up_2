class AddItemStatusReferenceToItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :items, :statuses, column: :item_status_id
    add_index :items, :item_status_id
    change_column_null :items, :item_status_id, false
  end
end
