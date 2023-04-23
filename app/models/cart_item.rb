class CartItem < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  belongs_to :product

# 消費税を求める
  def with_tax_price
    (price * 1.1).floor
  end
# 小計を求める
  def subtotal
    product.with_tax_price * product_amount
  end

end
