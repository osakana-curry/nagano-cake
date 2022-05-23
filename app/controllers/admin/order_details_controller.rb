class Admin::OrderDetailsController < ApplicationController

  def update
    @order = Order.find(params[:order_id])
    @order_detail.update(order_detail_params)
    redirect_to admin_order_detail_path(@order_detail.id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :amount, :price, :production_status)
  end

end
