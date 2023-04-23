class Type < ApplicationRecord
<<<<<<< HEAD
has_many :products
=======
  has_many :product, dependent: :destroy
>>>>>>> origin/develop
end
