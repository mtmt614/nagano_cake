class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @order_details = OrderDetail.where(order_id: @order)
    @making_status = @order.order_details.pluck(:making_status)
  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order)
    if @order.update(order_params)
      if @order.status.include?("入金確認")
         @order_details.update( making_status: 1)
      end
    redirect_to admin_order_path(@order)
    else
      render "show"
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:status)
  end
end
