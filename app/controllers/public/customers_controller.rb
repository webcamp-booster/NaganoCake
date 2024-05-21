class Public::CustomersController < ApplicationController
 before_action :authenticate_customer! 
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
      flash.now[:alert] = '保存に失敗しました。'
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    current_customer.update(is_active: false)
    reset_session
    redirect_to new_customer_session_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :telephone_number, :email)
  end
end
