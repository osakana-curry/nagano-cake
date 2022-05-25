class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)

    if @order.order_status == "入金確認"
      @order_details.update_all(production_status: 1)
    end

    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postcode, :name, :address, :delivery_fee, :charge, :pay_type, :order_status)
  end


end
