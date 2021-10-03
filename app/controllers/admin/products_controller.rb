class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:info] = "新商品を登録しました"
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @tax_included_price = Product.tax_included_price(@product)
  end
  
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:info] = "商品情報を編集しました"
      redirect_to admin_product_path(@product)
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :detail, :price, :image, :sales_status, :genre_id)
  end

end