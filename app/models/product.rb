class Product < ApplicationRecord
 has_one_attached :image
<<<<<<< HEAD
 belongs_to :type
=======
 has_many :order_products, dependent: :destroy
 has_many :cart_items, dependent: :destroy
 belongs_to :type
  
  def index
  end
  
>>>>>>> origin/develop
end
