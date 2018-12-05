class Product < ApplicationRecord

  include Hideable

  has_many :notifies

  belongs_to :company

end
