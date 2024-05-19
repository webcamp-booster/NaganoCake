class Public::CartItemsController < ApplicationController
  # before_action :authenticate_customer! 後ほど有効にしてください。
  #before_action :is_matching_login_user
  def index
    @cart_items = current_customer.cart_items
  end
  
  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:quantity].to_i
      
      cart_item.save
      redirect_to cart_items_path
    elsif @cart_item.save
          @cart_items = current_customer.cart_items.all
          render :index
    else
          render :index
    end
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      @cart_items = current_customer.cart_items
      render :index
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    @cart_items = CartItem.all
    render 'index'
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    render 'index'
  end

private
 def cart_item_params
   params.require(:cart_item).permit(:item_id, :price, :amount)
 end

end
