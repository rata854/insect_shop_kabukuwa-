class CartProduct < ApplicationRecord
  
  belongs_to :item
  belongs_to :customer
  
  validates :customer_id, :product_id, :admins, presence: true
  
end
