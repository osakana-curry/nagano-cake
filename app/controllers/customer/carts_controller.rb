class Customer::CartsController < ApplicationController


  before_action :authenticate_customer!


  def index
    @carts = Cart.all
    @total = @carts.inject(0) { |sum, item| sum + item.total }
  end

  def create
    @item = Item.find(cart_params[:item_id])
    @cart = current_customer.carts.new(cart_params)
    @cart.save
    redirect_to customer_carts_path
  end

  def update

  end

  def destroy
  end

  def all_destroy
  end

  private

  def cart_params
    params.require(:cart).permit(:item_id, :amount)
  end

end
