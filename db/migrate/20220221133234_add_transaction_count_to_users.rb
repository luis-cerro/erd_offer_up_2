class AddTransactionCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :transactions_count, :integer
  end
end
