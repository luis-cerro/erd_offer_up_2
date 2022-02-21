class Category < ApplicationRecord
  # Direct associations

  has_many   :items,
             foreign_key: "item_category_id"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    category_name
  end
end
