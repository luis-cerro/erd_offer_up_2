class AddStatusReferenceToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :transactions, :statuses
    add_index :transactions, :status_id
    change_column_null :transactions, :status_id, false
  end
end
