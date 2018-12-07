class Invitation < ApplicationRecord

  belongs_to :company

  before_create :set_token

  after_create :send_email

  scope :admins, -> { where(role: 'admin') }
  scope :clients, -> { where(role: 'client') }

  def send_email
    time = Time.now

    UserMailer.invitation_email(self)
    self.update(sent_at: time, updated_at: time)
  end

  private

  def set_token
    self.token = SecureRandom.hex(20)
  end

end
