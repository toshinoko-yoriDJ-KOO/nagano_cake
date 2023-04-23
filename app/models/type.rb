class Type < ApplicationRecord
  has_many :product, dependent: :destroy
end
