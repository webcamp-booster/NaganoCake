class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new #注文情報入力画面
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def confirm #注文情報入力確認画面
    @order = Order.new(order_params)
    @total = 0
    if params[:order][:address_option] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_option] == "1"
      selected = Address.find(params[:order][:address_id])
      @order.post_code = selected.post_code
      @order.address = selected.address
      @order.name = selected.name
      

    elsif params[:order][:address_option] == "2"
      @order.post_code = params[:order][:post_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]

    else
      render 'new'
    end

    @cart_items = current_customer.cart_items.all
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800

  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    #order_detailの保存
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.price = cart_item.item.add_tax_price
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end

    current_customer.cart_items.destroy_all
    redirect_to thanks_path
  end


  def thanks
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :name, :address, :post_code, :shipping_cost, :total_payment, :status)
  end

end
