module ApplicationHelper

  # 消費税計算
  def tax_included_price(price)
    (price * 1.1).floor(0)
  end

  # # 小計計算
  def sub_price(product_price, product_amount)
    (tax_included_price(product_price)) * (product_amount)
  end

  def total_price(cart_products)
    price = 0
    cart_products.each do |cart_product|
      product = Product.find(cart_product.product_id)
  	  price += (cart_product.amount * (product.price * 1.1).round)
  	end
    return price
  end

end
