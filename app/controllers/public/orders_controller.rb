class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :name, :address, :customer_id, :status, :shipping_cost)
  end
  
end
