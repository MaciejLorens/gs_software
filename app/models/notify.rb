class Notify < ApplicationRecord

  include Hideable

  before_create :set_number, :set_pin

  belongs_to :company
  belongs_to :driver, optional: true
  belongs_to :product, optional: true
  belongs_to :user
  belongs_to :client

  validate :validate_expiration

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
    }.to_json.to_s.encode('Windows-1250')
  end

  private

  def validate_expiration
    if expiration_to && (expiration_to <= expiration_from)
      errors.add(:expiration_to, I18n.t('errors.messages.must_be_valid_date'))
    end
  end

  def set_pin
    char_array = [('A'..'Z'), (0..9)].map(&:to_a).flatten - [0, 'O']
    self.pin = (0...6).map { char_array[rand(char_array.length)] }.join
  end

  def set_number
    date = DateTime.now.beginning_of_month
    this_month_number = company.notifies.where('created_at >= ?', date).count
    self.number = "#{date.year}/#{date.month}/#{this_month_number + 1}"
  end

end
