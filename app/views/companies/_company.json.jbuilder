json.extract! company, :id, :name, :address, :number, :postcode, :city, :country, :created_at, :updated_at
json.url company_url(company, format: :json)
