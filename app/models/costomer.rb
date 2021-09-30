class Costomer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :shipping_addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  
  validates :first_name, :last_name, :first_name_kana, :last_name_kana,
             presence: true
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
  
end
