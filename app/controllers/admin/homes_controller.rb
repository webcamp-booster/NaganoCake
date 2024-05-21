class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    range = Date.today.beginning_of_day..Date.today.end_of_day #　本日の0時〜23時59分までのデータを指定
    @orders = Order.where(created_at: range) # 本日の注文データのみ取ってくる
  end
  
  def customer_orders
    @customer = Customer.find(params[:id])
    @orders = @customer.orders
  end
end