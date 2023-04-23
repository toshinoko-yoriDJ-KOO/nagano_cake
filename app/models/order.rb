class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  
def with_tax_price
    (price * 1.1).floor
end

def subtotal
    product.with_tax_price * amount
end

# ごう作：注文情報入力画面の登録済住所のセレクトボックスへ適応
def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
end

end
