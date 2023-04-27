class DeliveryAddress < ApplicationRecord
  belongs_to :customer

# バリデーション
  validates :delivery_address_name, presence: true
  validates :delivery_address_other, presence: true
  validates :delivery_address_zip_code, presence: true


# ごう作：注文情報入力画面の登録済住所のセレクトボックスへ適応
  def address_display
  '〒' + delivery_address_zip_code + ' ' + delivery_address_other + ' ' + delivery_address_name
  end
end
