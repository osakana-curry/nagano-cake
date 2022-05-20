class Customer::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @items = Item.all
    @genres = Genre.all
    @cart = Cart.find(params[:id])

  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :text, :price, :sale_status, :image)
  end

end
