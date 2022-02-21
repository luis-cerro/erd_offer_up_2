class Status < ApplicationRecord
  # Direct associations

  has_many   :items,
             :foreign_key => "item_status_id"

  has_many   :transactions

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    status_description
  end

end
