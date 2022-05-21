class Customer::CartsController < ApplicationController
  include ApplicationHelper

  before_action :set_cart, only: [:update, :destroy]
  before_action :authenticate_customer!


  def index
    @carts = current_cart
    @total = @carts.inject(0) { |sum, item| sum + item.total }
  end

  def create
    @item = Item.find(cart_params[:item_id])
    @cart = current_customer.carts.new(cart_params)
    @cart.save
    redirect_to customer_carts_path
  end

  def update
    @cart = Cart.find(params[:id])
    @numbers = @cart.amount
    @cart.update(cart_params)
    redirect_to customer_carts_path
  end

  def destroy
    @cart.destroy
    @cart = current_cart
    redirect_to customer_carts_path
  end

  def all_destroy
    @carts = current_customer.carts
    @carts.destroy_all
    redirect_to customer_carts_path
  end

  private

  def cart_params
    params.require(:cart).permit(:item_id, :amount)
  end

end
