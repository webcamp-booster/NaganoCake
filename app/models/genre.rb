class Genre < ApplicationRecord
  has_many :items, dependent: :destroy

  # enum設定
	enum valid_invalid_status: { 有効: 0, 無効: 1} #enumの記述方式

  # バリデーション
	validates :name, presence: true #バリデーションname空欄禁止
end
