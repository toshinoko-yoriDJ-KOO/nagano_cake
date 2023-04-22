class Order < ApplicationRecord
    
has_many :order_products, dependent: :destroy
belongs_to :customer

def with_tax_price
    (price * 1.1).floor
end

def subtotal
    product.with_tax_price * amount
end

end
