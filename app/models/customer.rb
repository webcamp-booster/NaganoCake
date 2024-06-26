class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders,  dependent: :destroy
  has_many :addresses,  dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, presence: true
  validates :post_code, presence: true,length:{minimum:7,maximum:7}
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :is_active, inclusion: { in: [true,false] }

end
