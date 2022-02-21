class StatusResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :status_description, :string

  # Direct associations

  has_many   :items,
             foreign_key: :item_status_id

  has_many   :transactions

  # Indirect associations
end
