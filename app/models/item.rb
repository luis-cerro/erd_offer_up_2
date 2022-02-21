class Item < ApplicationRecord
  # Direct associations

  belongs_to :item_status,
             :class_name => "Status",
             :counter_cache => true

  belongs_to :owner,
             :class_name => "User",
             :counter_cache => true

  belongs_to :item_category,
             :class_name => "Category",
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    item_description
  end

end
