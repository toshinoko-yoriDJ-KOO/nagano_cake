class Product < ApplicationRecord
 has_one_attached :image
 has_many :order_products, dependent: :destroy
 has_many :cart_items, dependent: :destroy
 belongs_to :type

def with_tax_price
    (price * 1.1).floor
end

def get_image
  if image.attached?
    image
  else
    'no_image.jpg'
  end
end
end
