class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :buyer_id
      t.integer :item_id
      t.integer :status_id

      t.timestamps
    end
  end
end
