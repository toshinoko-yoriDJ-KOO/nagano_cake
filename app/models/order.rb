class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products, dependent: :destroy
  has_many :items, through: :order_items

# バリデーション新規配送先フォームを選択時に適応
  validates :zip_code, presence: true, if: -> { address == 'new_delivery_address' }
  validates :address, presence: true, if: -> { address == 'new_delivery_address' }
  validates :name, presence: true, if: -> { address == 'new_delivery_address' }

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting:0, confirm:1, making:2, preparation:3, sent:4 }
  
def with_tax_price
    (price * 1.1).floor
end

def subtotal
    product.with_tax_price * amount
end

end
