ApiToken.create(
  value: SecureRandom.hex(20)
)

3.times do |index|
  Company.create(
    name: "company_#{index}",
    address: "address_#{index}",
    postcode: "postcode_#{index}",
    city: "city_#{index}",
    country: "country_#{index}",
    created_at: rand(10).days.ago,
    email: "info_#{index}@gs-software.pl"
  )
end

User.create(
  first_name: "Maciej",
  last_name: "Lorens",
  email: "maciej.lorens@gmail.com",
  password: '1234567890',
  password_confirmation: '1234567890',
  role: 'super_admin',
  company_id: nil,
  created_at: rand(10).days.ago
)

6.times do |index|
  company = Company.all.to_a.sample

  User.create(
    first_name: "first_#{index}",
    last_name: "last_#{index}",
    email: "admin#{index}@gs.com",
    password: '1234567890',
    password_confirmation: '1234567890',
    role: 'admin',
    company_id: company.id,
    created_at: rand(10).days.ago
  )
end

15.times do |index|
  company = Company.all.to_a.sample

  User.create(
    first_name: "first_#{index}",
    last_name: "last_#{index}",
    email: "client#{index}@gs.com",
    password: '1234567890',
    password_confirmation: '1234567890',
    role: 'client',
    company_id: company.id,
    created_at: rand(10).days.ago
  )
end

Company.all.each_with_index do |company, i|
  3.times do |j|
    Driver.create(
      first_name: "first_#{i}_#{j}",
      last_name: "last_#{i}_#{j}",
      company_id: company.id,
      created_at: rand(10).days.ago
    )
  end
end

10.times do |index|
  company = Company.all.to_a.sample

  Product.create(
    name: "name_#{index}",
    number: "number_#{index}",
    company_id: company.id,
    created_at: rand(10).days.ago
  )
end

50.times do |index|
  company = Company.all.to_a.sample
  product = company.products.sample
  user = (company.users.clients + company.users.admins + company.users.super_admins).sample
  driver = company.drivers.sample

  Notify.create(
    car_number: "car_no_#{index}",
    semitrailer_number: "semi_no_#{index}",
    expiration_from: rand(1000).minutes.ago,
    expiration_to: rand(1000).minutes.from_now,
    hidden: false,
    hidden_at: nil,
    product_id: product.id,
    driver_id: driver.id,
    user_id: user.id,
    company_id: company.id,
    created_at: rand(1000).minutes.ago
  )
end
