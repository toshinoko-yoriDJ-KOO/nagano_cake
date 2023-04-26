class Product < ApplicationRecord
 has_one_attached :image
 has_many :order_products, dependent: :destroy
 has_many :cart_items, dependent: :destroy
 belongs_to :type

 enum status: { waiting:0, confirm:1, making:2, preparation:3, sent:4 }

def with_tax_price
    (price * 1.1).floor
end

def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no-image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    image.variant(resize_to_limit: [width, height]).processed
end

end
