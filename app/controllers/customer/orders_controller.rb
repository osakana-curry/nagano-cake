class Customer::OrdersController < ApplicationController
  def new #注文情報入力画面
    @orders = Order.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to customer_confirm_path
  end

  def index
  end

  def show
  end

  def confirm
    @order = Order.new(order_params)
      #  [:address_option]=="0"のデータ(memberの住所)を呼び出す
      if params[:order][:address_option] == "0"
        @order.postcode = current_customer.postcode
        @order.address = current_customer.address
        @order.name = current_customer.first_name + current_customer.last_name

      elsif params[:order][:address_option] == "1"
        ship = Address.find(params[:order][:address_id])
        @order.postcode = ship.postcode
        @order.address = ship.address
        @order.name = ship.name

      elsif params[:order][:address_option] = "2"
        @order.postcode = params[:order][:postcode]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
      else
            render 'new'
      end

    @carts = current_customer.carts.all

  end

  def complete

  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postcode, :name, :address, :delivery_fee, :charge, :pay_type, :order_status)
  end

end
