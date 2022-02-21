class AddOwnerReferenceToItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :items, :users, column: :owner_id
    add_index :items, :owner_id
    change_column_null :items, :owner_id, false
  end
end
