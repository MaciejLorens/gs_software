class Product < ApplicationRecord

  include Hideable

  has_many :receipts

  belongs_to :company

end
