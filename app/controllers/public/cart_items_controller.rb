class Public::CartItemsController < ApplicationController
  # before_action :authenticate_customer! 後ほど有効にしてください。
  #before_action :is_matching_login_user
  def index
    @cart_items = current_user.CartItem.all
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
  end

  def destroy_all
  end

  def subtotal
    item.with_tax_price * amount
  end

end
