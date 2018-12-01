class Driver < ApplicationRecord

  has_many :receipts

  belongs_to :company

  def full_name
    "#{first_name} #{last_name}"
  end

end
