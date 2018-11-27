json.extract! company, :id, :name, :street, :number, :postcode, :city, :country, :created_at, :updated_at
json.url company_url(company, format: :json)
