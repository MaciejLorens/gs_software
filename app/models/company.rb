class Company < ApplicationRecord

  include Hideable

  has_many :users
  has_many :drivers
  has_many :products
  has_many :notifies
  has_many :invitations

end
