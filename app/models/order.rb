class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: { waiting_for_payment: 0, comfirmed_payment: 1, in_production: 2, preparing_for_shipping: 3, shipped: 4 }

  def get_status
    I18n.t(
    if status == 0
      'waiting_for_payment'
    elsif status == 1
      'comfirmed_payment'
    elsif status == 2
      'in_production'
    elsif status == 3
      'preparing_for_shipping'
    elsif status == 4
      'shipped'
    end,
    scope: ["enums", "order", "status"])
  end

end
