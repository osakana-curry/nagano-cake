class Customer::AddressesController < ApplicationController

  before_action :authenticate_customer!

  def index
    @addresses = Address.all
    @address = Address.new

  end

  def create
    @address = Address.new(address_params)
    if @address.save
     flash.now[:notice] = "新規配送先を登録しました"
     redirect_to customer_addresses_path

    end
  end


  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to customer_addresses_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    @addresses = current_customer.address
    flash.now[:alert] = "配送先を削除しました"
    redirect_to customer_addresses_path
  end

  def address_params
    params.require(:address).permit(:name, :postcode, :address)
  end

end
