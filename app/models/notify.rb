class Notify < ApplicationRecord

  include Hideable

  before_create :set_number, :set_pin

  belongs_to :company
  belongs_to :driver, optional: true
  belongs_to :product
  belongs_to :user
  belongs_to :client

  def qr_code_string
    {
      notify: {
        id: id,
        pin: pin,
        number: number,
        car_number: car_number,
        semitrailer_number: semitrailer_number,
        expiration_from: expiration_from.to_i,
        indefinite: indefinite,
        expiration_to: expiration_to.to_i,
        active: active,
        hidden: hidden,
        hidden_at: hidden_at.to_i,
        updated_at: updated_at.to_i,
        created_at: created_at.to_i,
      },
      client: {
        id: client_id,
        name: client.name
      },
      product: {
        id: product_id,
        code: product.code,
        name: product.name,
      },
      driver: {
        id: driver_id,
        first_name: driver.first_name,
        last_name: driver.last_name
      },
      creator: {
        id: user.id,
        email: user.email,
        first_name: user.first_name,
        last_name: user.last_name
      },
      company: {
        id: company_id,
        name: company.name
      }
    }.to_json.to_s
  end

  private

  def set_pin
    self.pin = rand(36 ** 6).to_s(36).upcase
  end

  def set_number
    date = DateTime.now.beginning_of_month
    this_month_number = company.notifies.where('created_at >= ?', date).count
    self.number = "#{date.year}/#{date.month}/#{this_month_number + 1}"
  end

end
