class Customer::ItemsController < ApplicationController

  def index
    @items = Item.order("created_at desc").page(params[:page]).per(8)
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
