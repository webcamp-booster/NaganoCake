class Public::ItemsController < ApplicationController
  def index
  end

  def show
  end

  def with_tax_price
    (price * 1.1).floor
  end
end
