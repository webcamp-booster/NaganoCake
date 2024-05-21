class Public::ItemsController < ApplicationController
  def index
    # ページネーションの対象を販売ステータスのtrueに絞る、ページネーションの設定
    @items = Item.where(is_active: true).page(params[:page]).per(8)
    @active_items_count = Item.where(is_active: true).count
    @genres = Genre.all
    # ジャンルIDに紐づけた
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.where(is_active: true).page(params[:page]).per(8)
      @active_items_count = @genre.items.where(is_active: true).count
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
    @genres = Genre.all
  end



  private
    def item_params
      params.require(:item).permit(:genre_id, :name, :introduction, :image, :price)
    end


end
