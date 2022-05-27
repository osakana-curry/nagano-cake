class HomesController < ApplicationController
  def top
    @items=Item.all.order("created_at asc")

    @item1 = Item.first
    @item2 = Item.second
    @item3 = Item.third
    @item4 = Item.fourth
  end

  def about
  end
end
