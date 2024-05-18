class Address < ApplicationRecord
  belongs_to :customer

  validates :customer_id, presence: true
  validates :name, presence: true
  validates :post_code, presence: true
  validates :address, presence: true

end
