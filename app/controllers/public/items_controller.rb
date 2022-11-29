class Public::ItemsController < ApplicationController
  
  def index
    @genres = Genre.all
    @all_items = Item.all
    @items = Item.page(params[:page]).per(8)
  end
  
  def show
    @genres =Genre.all
    @item = Item.find(params[:id])
  end
  
end
