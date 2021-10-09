class ShippingAddress < ApplicationRecord
  
  belongs_to :customer
  
  # validetes :customer_id, :name, :address, presence: true
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
  
end
