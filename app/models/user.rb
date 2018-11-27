class User < ApplicationRecord

  has_many :receipts
  belongs_to :company

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable

  scope :admins, -> { where(role: 'admin') }
  scope :clients, -> { where(role: 'client') }
  scope :drivers, -> { where(role: 'driver') }

  validates_presence_of :first_name, :last_name, :role, :company_id

  def admin?
    role == 'admin'
  end

  def client?
    role == 'client'
  end

  def driver?
    role == 'driver'
  end

end
