class Customer::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new #注文情報入力画面
    @orders = Order.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.carts.each do |cart|
     @order_details = OrderDetail.new #初期化宣言
     @order_details.order_id = @order.id #order注文idを紐付けておく
     @order_details.item_id = cart.item_id #カート内商品idを注文商品idに代入
     @order_details.amount = cart.amount #カート内商品の個数を注文商品の個数に代入
     @order_details.price = (cart.item.price*1.1).floor #消費税込みに計算して代入
     @order_details.save #注文商品を保存
    end #ループ終わり

    current_customer.carts.destroy_all #カートの中身を削除
    redirect_to  customer_complete_path
  end


  def index
    @orders = Order.order("created_at desc").page(params[:page]).per(10)
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def confirm
    @order = Order.new(order_params)
      #  [:address_option]=="0"のデータ(memberの住所)を呼び出す
      if params[:order][:address_option] == "0"
        @order.postcode = current_customer.postcode
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name

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
    @order.customer_id = current_customer.id

  end

  def complete

  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postcode, :name, :address, :delivery_fee, :charge, :pay_type, :order_status)
  end

end
