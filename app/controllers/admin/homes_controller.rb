class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @orders = Order.all
  end
  
  def customer_orders
    @customer = Customer.find(params[:id])
    @orders = @customer.orders
  end
end