class Public::OrdersController < ApplicationController

  def new
    @customer = current_customer
    @order = Order.new(customer_id: @customer.id)
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
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postal_code = session[:postal_code]
    @order.address = session[:address]
    @order.name = session[:name]
    # @order.shipping_cost = 800
    # @order.payment_method = session[:payment_method]
    # @order.billing_amount = @total_price
    # @order.orders_status = 0
    unless @order.save
      flash[:notice] = "情報を入力してください"
      redirect_to new_public_order_path
    else
    # saveができた段階でOrderモデルにorder_idが入る     # オーダー商品ごとの詳細の保存
      current_customer.cart_products.each do |cart|
        @orders_products = OrdersProduct.new
        @orders_products.item_name = cart.product.name
        @orders_products.order_id = @order.id
        @orders_products.item_id = cart.product_id
        @orders_products.master_price = (cart.product.price.to_i * 1.1).round
        @orders_products.amount = cart.amount
        @orders_products.production_status = 0
        @orders_products.save!
      end
    end
  end

  def completed
  end

  def index
    @orders = Order.all
  end

  def show
  end

  private

  def order_params
    params.permit(:postal_code, :address, :name, :shipping_cost, :billing_amount, :payment_method, :orders_status)
  end

end
