class OrderProduct < ApplicationRecord
  
  belongs_to :order
  belongs_to :product
  
  validates :product_id, :order_id, :quantity, :master_price,
             presence: true
             
  enum production_status: { "着手不可": 0, "制作待ち": 1, "製作中": 2, "制作完了": 3 }
  
end
