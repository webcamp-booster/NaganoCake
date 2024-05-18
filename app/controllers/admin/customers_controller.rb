class Admin::CustomersController < ApplicationController
  # before_action :authenticate_admin! 後ほど有効にしてください。
  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end
  
end
