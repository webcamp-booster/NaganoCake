class Public::CartItemsController < ApplicationController
  # before_action :authenticate_customer! 後ほど有効にしてください。
  #before_action :is_matching_login_user
  def index
    @cart_items = current_customer.cart_items
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    @cartitems = CartItem.all
    render 'index'
  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
    render 'index'
  end

  def subtotal
    item.with_tax_price * amount
  end

end
