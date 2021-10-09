class Public::CartProductsController < ApplicationController

  def index
    @cart_products = current_customer.cart_products

  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.customer_id = current_customer.id
    if @cart_product.save
      redirect_to public_cart_products_path
    else
      flash[:alert] = "個数を選択してください"
      redirect_back(fallback_location: root_path)
    end
  end

  def update
  end

  def destroy
  end

  def all_destroy
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:amount, :product_id)
  end

end
