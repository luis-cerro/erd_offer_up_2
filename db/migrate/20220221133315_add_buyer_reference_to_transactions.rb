class AddBuyerReferenceToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :transactions, :users, column: :buyer_id
    add_index :transactions, :buyer_id
    change_column_null :transactions, :buyer_id, false
  end
end
