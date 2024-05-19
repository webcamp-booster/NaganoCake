class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
    @active_items_count = Item.where(is_active: true).count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item =CartItem
  end
  
  

  private
    def item_params
      params.require(:item).permit(:genre_id, :name, :introduction, :image, :price)
    end
  

end
