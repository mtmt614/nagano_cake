class Admin::OderDetailsController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    
    @order_detail.update(order_detail_params)
    @order = @order_detail.order
    
    if @order_detail.making_status == "製作中"
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
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :making_status, :count)
  end
end
