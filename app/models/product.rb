class Product < ApplicationRecord

  has_many :cart_products
  has_many :order_products
  belongs_to :genre

  validates  :name, :price, presence: true
  validates :price, numericality: { only_integer: true }

  enum sales_status: { "販売中": true, "販売停止": false }

  attachment :image

end
