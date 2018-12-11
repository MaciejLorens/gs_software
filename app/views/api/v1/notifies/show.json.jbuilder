json.extract! @notify,
              :id,
              :pin,
              :number,
              :car_number,
              :semitrailer_number,
              :expiration_from,
              :expiration_to,
              :indefinite,
              :hidden,
              :hidden_at,
              :active,
              :updated_at,
              :created_at

json.expiration_from @notify.expiration_from.to_i
json.expiration_to @notify.expiration_to.to_i
json.updated_at @notify.updated_at.to_i
json.created_at @notify.created_at.to_i
json.hidden_at @notify.hidden_at.to_i

json.creator do
  json.id @notify.user.id
  json.email @notify.user.email
  json.first_name @notify.user.first_name
  json.last_name @notify.user.last_name
  json.hidden @notify.user.hidden
  json.hidden_at @notify.user.hidden_at.to_i
  json.role @notify.user.role
end

json.product do
  json.id @notify.product.id
  json.number @notify.product.code
  json.name @notify.product.name
  json.hidden @notify.product.hidden
  json.hidden_at @notify.product.hidden_at.to_i
end

json.driver do
  json.id @notify.driver.id
  json.first_name @notify.driver.first_name
  json.last_name @notify.driver.last_name
  json.hidden @notify.driver.hidden
  json.hidden_at @notify.driver.hidden_at.to_i
end

json.company do
  json.id @notify.company.id
  json.name @notify.company.name
  json.address @notify.company.address
  json.postcode @notify.company.postcode
  json.city @notify.company.city
  json.country @notify.company.country
  json.email @notify.company.email
end
