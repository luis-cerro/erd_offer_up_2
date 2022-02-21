class ItemResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :item_description, :string
  attribute :item_status_id, :integer
  attribute :item_title, :string
  attribute :item_category_id, :integer
  attribute :item_location, :string
  attribute :owner_id, :integer
  attribute :price, :string

  # Direct associations

  belongs_to :item_category,
             resource: CategoryResource

  # Indirect associations

end
