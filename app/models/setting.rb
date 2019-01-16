class Setting < ApplicationRecord

  def self.token
    Setting.find_by(key: 'Api Token')
  end

  def self.qr_code_size
    Setting.find_by(key: 'QR Code Size')
  end

  def refresh_token
    self.update(value: SecureRandom.hex(20))
  end

end
