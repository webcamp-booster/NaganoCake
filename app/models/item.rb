class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  has_one_attached :image

# 税込価格の表記
  def add_tax_price
    (self.price * 1.1).round
  end

end
