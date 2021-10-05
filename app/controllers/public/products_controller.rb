class Public::ProductsController < ApplicationController
  
  def top
    @products = Product.all
  end

  def about
  end
  
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct
  end
  
end
