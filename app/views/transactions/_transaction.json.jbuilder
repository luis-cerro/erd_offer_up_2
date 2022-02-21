json.extract! transaction, :id, :buyer_id, :item_id, :status_id, :created_at,
              :updated_at
json.url transaction_url(transaction, format: :json)
