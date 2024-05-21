class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    # もともとカート内に同じ商品があれば、「数量を追加」を更新・保存する
      # もともとカートにあるもの「item_id」、今追加した「params[:cart_item][:item_id]」
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      # 追加した「params[:cart_item][:item_id]」を加える、to_iで数字として扱う
      cart_item.amount += params[:cart_item][:amount].to_i
      # カート商品を保存後はカートアイテム一覧へページ遷移
      cart_item.save
      redirect_to cart_items_path
      # もしカート内に同じ商品がない場合は通常保存
    elsif @cart_item.save
          @cart_items = current_customer.cart_items.all
          render :index
      #保存できなかった場合
    else
      @cart_items = current_customer.cart_items
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
