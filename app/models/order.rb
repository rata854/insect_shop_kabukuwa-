class Order < ApplicationRecord
  
  has_many :order_products
  belongs_to :current
  
  validates :customer_id, :address, :name, :products,
            :total_price, :payment_method, presence: true
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
  
  enum payment_method: { "クレジットカード": 0, "銀行振込": 1 }
  enum order_status: { "入金待ち": 0, "入金確認": 1, "発送準備": 2, "発送済み": 3 }
  
end
