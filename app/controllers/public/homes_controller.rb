class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all 
    @items = Item.where(is_active: true).order('id DESC').limit(4)# 先頭から4つのレコードを取得
  end

  def about
  end
end
