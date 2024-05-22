class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all 
    @items = Item.order('id DESC').limit(4)# 先頭から4つのレコードを取得
  end

  def about
  end
end
