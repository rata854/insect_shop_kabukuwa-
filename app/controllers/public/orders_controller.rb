class Public::OrdersController < ApplicationController
  
  def new
    @customer = current_customer
    @order = Order.new(customer_id: @customer)
    @shipping_addres = @customer.shipping_addresses
    @ship_to_address = ShippingAddress.new(customer_id: @customer.id)
  end

  def confirm
    @customer = current_customer
    @order = Order.new
    @shipping_addres = @customer.shipping_addresses
    @cart_products = current_customer.cart_products
  end

  def create
    @orders = current_customer.orders
    @cart_products = CartProduct.where(customer_id: current_customer.id)
  end

  def completed
  end

  def index
  end

  def show
  end
  
end
