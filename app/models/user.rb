class User < ApplicationRecord

  include Hideable

  has_many :receipts

  belongs_to :company, optional: true

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :lockable

  scope :super_admins, -> { where(role: 'super_admin') }
  scope :admins, -> { where(role: 'admin') }
  scope :clients, -> { where(role: 'client') }

  validates_presence_of :first_name, :last_name, :role

  def super_admin?
    role == 'super_admin'
  end

  def admin?
    role == 'admin'
  end

  def client?
    role == 'client'
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
