class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postcode, :name, :address, :delivery_fee, :charge, :pay_type, :order_status)
  end


end
