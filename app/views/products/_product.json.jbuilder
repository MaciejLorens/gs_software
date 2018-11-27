json.extract! product, :id, :name, :number, :hidden, :hidden_at, :created_at, :updated_at
json.url product_url(product, format: :json)
