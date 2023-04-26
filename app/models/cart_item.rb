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
  


def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no-image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    image.variant(resize_to_limit: [width, height]).processed
end

end
