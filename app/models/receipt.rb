class Receipt < ApplicationRecord
  belongs_to :company

  belongs_to :user

  belongs_to :product

  belongs_to :driver,
             class_name: 'User',
             foreign_key: :driver_id
end
