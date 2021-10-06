class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def withdrawal
  end

  def unsubscribe
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:info] = "会員情報を編集しました"
      redirect_to public_customer_path(@customer)
    else
      render :edit
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, 
                                     :first_name_kana, :postal_code, :address, :phone_number, :users_srarus)
  end
  
end
