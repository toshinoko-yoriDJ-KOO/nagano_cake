class Customer < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :delivery_addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  # バリデーション後で書きます。byごう
  # with_options presence: true do
  # validates :
  # end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
