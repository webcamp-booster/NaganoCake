class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  TAX_RATE = 1.1
  
  def get_subtotal
    item.price * TAX_RATE * amount
  end
end
