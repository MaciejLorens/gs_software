class Driver < ApplicationRecord

  include Hideable

  has_many :notifies

  belongs_to :company

  def full_name
    "#{first_name} #{last_name}"
  end

end
