class Product < ApplicationRecord

  has_many :cart_products
  has_many :order_products
  belongs_to :genre

  validates  :name, :price, presence: true
  validates :price, numericality: { only_integer: true }

  attachment :image

end
