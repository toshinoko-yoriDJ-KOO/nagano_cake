class DeliveryAddress < ApplicationRecord
  belongs_to :customer

# バリデーション
  validates :delivery_address_name, presence: true
  validates :delivery_address_other, presence: true
  validates :delivery_address_zip_code, presence: true
end
