class Product < ApplicationRecord

  has_many :cart_products
  has_many :order_products
  belongs_to :genre

  validates  :name, :price, presence: true
  validates :price, numericality: { only_integer: true }

  enum sales_status: { "販売中": false, "販売停止": true }

  attachment :image

  # 消費税計算
  def self.tax_included_price(product)
      (product.price * 1.1).floor(0)
  end

end
