json.extract! item, :id, :item_description, :item_status_id, :item_title, :item_category_id, :item_location, :owner_id, :price, :created_at, :updated_at
json.url item_url(item, format: :json)
