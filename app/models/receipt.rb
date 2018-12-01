class Receipt < ApplicationRecord

  include Hideable

  before_create :set_number

  belongs_to :company
  belongs_to :driver
  belongs_to :product
  belongs_to :user

  def qr_code_string
    {
      number: number,
      car_number: car_number,
      semitrailer_number: semitrailer_number,
      expiration_from: expiration_from.to_i,
      expiration_to: expiration_to.to_i,
      hidden: hidden,
      hidden_at: hidden_at.to_i,
      product_id: product_id,
      product: product.name,
      driver_id: driver_id,
      driver: driver.full_name,
      user_id: user_id,
      user: user.full_name,
      company_id: company_id,
      company: company.name,
      updated_at: updated_at.to_i,
      created_at: created_at.to_i
    }.to_json.to_s
  end

  private

  def set_number
    date = DateTime.now.beginning_of_month
    this_month_number = self.class.where('created_at >= ?', date).count
    self.number = "#{date.year}/#{date.month}/#{this_month_number + 1}"
  end

end
