json.notify do
  json.id @notify.id
  json.pi @notify.pin
  json.nu @notify.number
  json.cn @notify.car_number
  json.tn @notify.trailer_number
  json.ef @notify.expiration_from.to_i
  json.in @notify.indefinite ? 1 : 0
  json.et @notify.expiration_to.to_i
  json.ac @notify.active ? 1 : 0
  json.hi @notify.hidden_at ? 1 : 0
end

json.client do
  json.id @notify.client.id
  json.na @notify.client.name
  json.ad @notify.client.address
  json.po @notify.client.postcode
  json.ci @notify.client.city
  json.co @notify.client.country
end

if @notify.product.present?
  json.product do
    json.id @notify.product.id
    json.co @notify.product.code
    json.na @notify.product.name
  end
else
  json.product(nil)
end

if @notify.driver.present?
  json.driver do
    json.id @notify.driver.id
    json.fn @notify.driver.first_name
    json.ln @notify.driver.last_name
  end
else
  json.driver(nil)
end

json.company do
  json.id @notify.company.id
  json.na @notify.company.name
end
