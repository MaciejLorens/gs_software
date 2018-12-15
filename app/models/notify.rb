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
        pi: pin,
        nu: number,
        cn: car_number,
        tn: trailer_number,
        ef: expiration_from.to_i,
        in: indefinite ? 1 : 0,
        et: expiration_to.to_i,
        ac: active ? 1 : 0,
        hi: hidden ? 1 : 0
      },
      client: {
        id: client_id,
        na: client.name,
        ad: client.address,
        po: client.postcode,
        ci: client.city,
        co: client.country
      },
      product: {
        id: product_id,
        co: product.code,
        na: product.name,
      },
      driver: {
        id: driver_id,
        fn: driver.try(:first_name),
        ln: driver.try(:last_name)
      },
      company: {
        id: company_id,
        na: company.name
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
