class Product < ApplicationRecord
  has_many :receipts
  belongs_to :company

end
