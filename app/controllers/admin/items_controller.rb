class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :sale_status)
  end

end
