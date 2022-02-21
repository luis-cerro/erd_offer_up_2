class AddItemCountToStatuses < ActiveRecord::Migration[6.0]
  def change
    add_column :statuses, :items_count, :integer
  end
end
