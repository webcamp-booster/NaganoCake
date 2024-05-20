class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: { waiting_for_payment: 0, comfirmed_payment: 1, in_production: 2, preparing_for_shipping: 3, shipped: 4 }

  def get_items_total_price
    items_total_price = 0
    order_details.each do |order_detail|
      items_total_price += order_detail.price
    end
    return items_total_price
  end

end
