class Client < ApplicationRecord

  include Hideable

  has_many :notifies
  has_many :users
  has_many :invitations

  belongs_to :company

end
