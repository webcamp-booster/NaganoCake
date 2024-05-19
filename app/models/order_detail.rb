class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  def get_subtotal
    item.add_tax_price * amount
  end
end
