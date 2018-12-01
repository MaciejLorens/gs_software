class Company < ApplicationRecord
  has_many :users
  has_many :drivers
  has_many :products
  has_many :receipts

end
