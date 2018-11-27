json.extract! receipt, :id, :number, :car_number, :semitrailer_number, :company_id, :product_id, :expiration_from, :expiration_to, :hidden, :hidden_at, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
