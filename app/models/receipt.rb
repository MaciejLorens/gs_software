class Receipt < ApplicationRecord

  include Hideable

  before_create :set_number

  belongs_to :company
  belongs_to :driver
  belongs_to :product
  belongs_to :user

  private

  def set_number
    date = DateTime.now.beginning_of_month
    this_month_number = self.class.where('created_at >= ?', date).count
    self.number = "#{date.year}/#{date.month}/#{this_month_number + 1}"
  end

end
