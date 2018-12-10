class ApiToken < ApplicationRecord

  def refresh
    self.update(value: SecureRandom.hex(20))
  end

end
