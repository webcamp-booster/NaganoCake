class Admin::ItemsController < ApplicationController
  # before_action :authenticate_admin!　後ほど有効にしてください。
  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new

    
  end
  
  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  
  
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :genre_id, :is_active)
  end
  
end
