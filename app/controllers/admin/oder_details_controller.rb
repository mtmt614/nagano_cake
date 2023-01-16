class Admin::OderDetailsController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
