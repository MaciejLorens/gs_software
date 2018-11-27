maciej = User.create(
  first_name: 'Maciej',
  last_name: 'Lorens',
  email: 'maciej.lorens@gmail.com',
  password: '1234567890',
  password_confirmation: '1234567890',
  role: 'admin'
)

user1 = User.create(
  first_name: 'Will',
  last_name: 'Smith',
  email: 'will@smith.com',
  password: '1234567890',
  password_confirmation: '1234567890',
  role: 'user'
)

user2 = User.create(
  first_name: 'Bruce',
  last_name: 'Willis',
  email: 'bruce@willis.fm',
  password: '1234567890',
  password_confirmation: '1234567890',
  role: 'user'
)

driver1 = User.create(
  first_name: 'Sean',
  last_name: 'Connery',
  email: 'sean@connery.fm',
  password: '1234567890',
  password_confirmation: '1234567890',
  role: 'driver'
)

driver2 = User.create(
  first_name: 'Matt',
  last_name: 'Damon',
  email: 'matt@damon.fm',
  password: '1234567890',
  password_confirmation: '1234567890',
  role: 'driver'
)
