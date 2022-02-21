class AddTransactionCountToStatuses < ActiveRecord::Migration[6.0]
  def change
    add_column :statuses, :transactions_count, :integer
  end
end
