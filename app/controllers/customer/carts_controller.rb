class Customer::CartsController < ApplicationController

  before_action :authenticate_customer!


  def index
    @carts = current.cart
  end

  def create
    @cart = current_customer.carts.new(params_cart)
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
