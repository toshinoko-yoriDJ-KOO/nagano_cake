class Customer < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :delivery_addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

  #バリデーション
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :last_name_kana, presence: true
    validates :first_name_kana, presence: true
    validates :zip_code, presence: true
    validates :address, presence: true
    validates :phone_number, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def is_deleted
    !is_active
  end
end
