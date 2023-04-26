class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products, dependent: :destroy
  has_many :items, through: :order_items

# バリデーション
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :total_payment, presence: true
  validates :shopping_cost, presence: true
  validates :payment_method, presence: true

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting:0, confirm:1, making:2, preparation:3, sent:4 }

def with_tax_price
    (price * 1.1).floor
end

def subtotal
    product.with_tax_price * amount
end

def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no-image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    image.variant(resize_to_limit: [width, height]).processed
end

end
