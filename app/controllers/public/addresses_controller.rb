class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = current_customer.addresses.new(address_params)
    if @address.save
      redirect_to addresses_path, notice: '新しい配送先を登録しました。'
    else
      @addresses = Address.where(customer_id: current_customer.id)
      flash.now[:alert] = '配送先の登録に失敗しました。'
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path, notice: '配送先の情報を更新しました。'
    else
      flash.now[:alert] = '配送先情報の更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    Address.find(params[:id]).destroy
    redirect_to addresses_path, notice: '配送先を削除しました。'
  end

  private

  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end
end
