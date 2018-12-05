class Invitation < ApplicationRecord

  belongs_to :company

  before_create :set_token

  after_create :send_email

  scope :admins, -> { where(role: 'admin') }
  scope :clients, -> { where(role: 'client') }

  def send_email
    # === TODO:Maciej: send email based on company smtp credentials
    time = Time.now
    self.update(sent_at: time, updated_at: time)
  end

  private

  def set_token
    self.token = SecureRandom.hex(20)
  end

end
