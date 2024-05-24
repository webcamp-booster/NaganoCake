class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @orders = Order.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def customer_orders
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.order(created_at: :desc).page(params[:page]).per(10)
  end
end