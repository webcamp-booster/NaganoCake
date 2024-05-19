class Public::ItemsController < ApplicationController
  def index
    # ページネーションの対象を販売ステータスのtrueに絞る、ページネーションの設定
    @items = Item.where(is_active: true).page(params[:page]).per(8)
    @active_items_count = Item.where(is_active: true).count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end
  
  

  private
    def item_params
      params.require(:item).permit(:genre_id, :name, :introduction, :image, :price)
    end
  

end
