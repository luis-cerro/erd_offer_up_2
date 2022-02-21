class Transaction < ApplicationRecord
  # Direct associations

  belongs_to :status,
             counter_cache: true

  belongs_to :buyer,
             class_name: "User",
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    buyer.to_s
  end
end
