class Admin::OrderDetailsController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order_details = OrderDetail.find(params[:id])
    
    @order_details.update(order_details_params)
    @order = @order_details.order
    
    if @order_details.making_status == "製作中"
      @order.update(status: 2)
      @order.save
    end
    
    if @order.order_details.count == @order.order_details.where(making_status: 3).count
      @order.update(status: 3)
      @order.save
    end
    
    redirect_back(fallback_location: root_path)
  end


  private
  def order_details_params
    params.require(:order_detail).permit(:order_id, :making_status, :count)
  end
end
