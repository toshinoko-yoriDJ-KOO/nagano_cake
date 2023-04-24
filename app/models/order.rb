class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products, dependent: :destroy
  has_many :items, through: :order_items
  has_many :order_items, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting:0, confirm:1, making:2, preparation:3, sent:4 }
  
def with_tax_price
    (price * 1.1).floor
end

def subtotal
    product.with_tax_price * amount
end

end
