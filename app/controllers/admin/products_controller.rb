class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      # flash[:info] = "新商品を登録しました"
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  def index
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def product_params
    params.permit(:name, :detail, :price, :image, :sales_status, :genre_id)
  end

end
