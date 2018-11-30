3.times do |index|
  Company.create(
    name: "company_#{index}"
  )
end

User.create(
  first_name: "Maciej",
  last_name: "Lorens",
  email: "maciej.lorens@gmail.com",
  password: '1234567890',
  password_confirmation: '1234567890',
  role: 'admin',
  company_id: Company.all.to_a.sample.id
)

6.times do |index|
  company = Company.all.to_a.sample

  User.create(
    first_name: "first_name_#{index}",
    last_name: "last_name_#{index}",
    email: "admin#{index}@gs.com",
    password: '1234567890',
    password_confirmation: '1234567890',
    role: 'admin',
    company_id: company.id
  )
end

15.times do |index|
  company = Company.all.to_a.sample

  User.create(
    first_name: "first_name_#{index}",
    last_name: "last_name_#{index}",
    email: "client#{index}@gs.com",
    password: '1234567890',
    password_confirmation: '1234567890',
    role: 'client',
    company_id: company.id
  )
end

7.times do |index|
  company = Company.all.to_a.sample

  User.create(
    first_name: "first_name_#{index}",
    last_name: "last_name_#{index}",
    email: "driver#{index}@gs.com",
    password: '1234567890',
    password_confirmation: '1234567890',
    role: 'driver',
    company_id: company.id
  )
end

10.times do |index|
  company = Company.all.to_a.sample

  Product.create(
    name: "product_name_#{index}",
    number: "product_no_#{index}",
    company_id: company.id
  )
end

50.times do |index|
  company = Company.all.to_a.sample
  product = company.products.sample
  user = (company.users.clients + company.users.admins).sample
  driver = company.users.drivers.sample

  Receipt.create(
    number: "receipt_#{index}",
    car_number: "car_no_#{index}",
    semitrailer_number: "semi_no_#{index}",
    expiration_from: 1.day.from_now,
    expiration_to: 3.days.from_now,
    hidden: false,
    hidden_at: nil,
    product_id: product.id,
    driver_id: driver.id,
    user_id: user.id,
    company_id: company.id
  )
end
