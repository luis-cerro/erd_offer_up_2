class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :user_name, :string

  # Direct associations

  has_many   :items,
             foreign_key: :owner_id

  has_many   :transactions,
             foreign_key: :buyer_id

  # Indirect associations
end
