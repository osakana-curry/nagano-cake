class Customer::AddressesController < ApplicationController

  before_action :authenticate_customer!

  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
     redirect_to customer_addresses_path
    else
     @addresses = Address.all
     render :index
    end
  end


  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
    redirect_to customer_addresses_path
    else
    render :edit
    end
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
