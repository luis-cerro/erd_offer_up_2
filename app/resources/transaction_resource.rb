class TransactionResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :buyer_id, :integer
  attribute :item_id, :integer
  attribute :status_id, :integer

  # Direct associations

  belongs_to :buyer,
             resource: UserResource

  # Indirect associations

end
