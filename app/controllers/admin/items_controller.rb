class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(10)
    @item = Item.new
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      @genres = Genre.all
      render:new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  def destroy
    @item=Item.find(params[:id])
    @item.destroy
    redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :text, :price, :sale_status, :image)
  end

end
