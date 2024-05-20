class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum making_status: { unable_manufacture: 0, waiting_for_manufacture: 1, in_production: 2, production_completed: 3 }
  
  def get_subtotal
    item.add_tax_price * amount
  end
end
