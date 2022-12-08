class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = Cart_items.all
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
  
end
