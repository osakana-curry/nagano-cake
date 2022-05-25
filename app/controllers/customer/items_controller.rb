class Customer::ItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @items = Item.all.page(params[:page]).per(8)
    @genres = Genre.all
    @amount = Item.count

  end

  def show
    @genres = Genre.all
    @items = Item.all
    @item = Item.find(params[:id])
    @cart = Cart.new
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :text, :price, :sale_status, :image)
  end

end
