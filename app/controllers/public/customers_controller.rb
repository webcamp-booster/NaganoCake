class Public::CustomersController < ApplicationController
  # before_action :authenticate_customer! 後ほど有効にしてください。
  # before_action :ensure_current_customer! 
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @current_customer.update(customer_params)
      redirect_to my_page_path, notice: '変更内容を保存しました。'
    else
      render :edit
    end
  end

  def unsubscribe
  end
  
  def withdraw
    current_customer.update(is_active: false)
    redirect_to new_customer_session_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :telephone_number, :email)
  end
  
  def ensure_current_customer
    customer = Customer.find(params[:id])
    unless current_customer.id == customer.id
      redirect_to my_page_path(current_customer.id)
    end
  end
end
