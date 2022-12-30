class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def index
    @orders = current_customer.orders.all
  end
  
  def show
    @params = params[:check]
    if @params
      @order = Order.find(params[:id])
    else
      redirect_to root_path
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :name, :address, :customer_id, :status, :shipping_cost)
  end
  
end
