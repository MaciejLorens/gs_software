class User < ApplicationRecord

  include Hideable

  has_many :notifies

  belongs_to :company, optional: true
  belongs_to :client, optional: true

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :lockable

  scope :super_admins, -> { where(role: 'super_admin') }
  scope :admins, -> { where(role: 'admin') }
  scope :users, -> { where(role: 'user') }

  validates_presence_of :first_name, :last_name, :role

  def super_admin?
    role == 'super_admin'
  end

  def admin?
    role == 'admin'
  end

  def user?
    role == 'user'
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
