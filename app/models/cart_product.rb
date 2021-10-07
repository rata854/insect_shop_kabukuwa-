class CartProduct < ApplicationRecord

  belongs_to :product
  belongs_to :customer

  validates :customer_id, :product_id, :amount, presence: true

  # 合計金額
  # def total_price
  #   self.each do |cart_product|
  #     product = Product.find(cart_product.product_id)
  #     total_price += (cart_product.amount.to_i * (product.price.to_i * 1.1).round)
  #   end
  # end



end
