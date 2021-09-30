class Product < ApplicationRecord
  
  has_many :cart_products, :cart_products, :orders, :order_products
  belongs_to :genre
  
  attachment :image_id
  
  validates :genre_id, :name, :price, presence: true
  validates :price, numericality: { only_integer: true }
  
end
