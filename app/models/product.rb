class Product < ApplicationRecord
 has_one_attached :image
 has_many :order_products, dependent: :destroy
 has_many :cart_items, dependent: :destroy
 belongs_to :type
 
end
