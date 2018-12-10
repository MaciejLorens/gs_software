class Notify < ApplicationRecord

  include Hideable

  before_create :set_number, :set_pin

  belongs_to :company
  belongs_to :driver, optional: true
  belongs_to :product
  belongs_to :user

  def qr_code_string
    {
      id: id,
      pin: pin,
      number: number,
      car_number: car_number,
      semitrailer_number: semitrailer_number,
      expiration_from: expiration_from.to_i,
      indefinite: indefinite,
      expiration_to: expiration_to.to_i,
      hidden: hidden,
      hidden_at: hidden_at.to_i,
      product_id: product_id,
      product_name: product.name,
      driver_id: driver_id,
      driver_full_name: driver.try(:full_name),
      active: active,
      created_at: created_at.to_i,
      company_id: company_id,
      company_name: company.name
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
