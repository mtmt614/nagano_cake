class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
  
end
