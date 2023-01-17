class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_option] == "1"
      ship = Address.find(params[:order][:address_id])
      @order.address = ship.address
      @order.postal_code = ship.postal_code
      @order.name = ship.name

    elsif params[:order][:address_option] == "2"
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      @order.postal_code = params[:order][:postal_code]

    else
      render :new
    end

    @cart_items = current_customer.cart_items.all
    @order.shipping_cost = 800
    @total = 0
    @cart_items.each do |cart_item|
    @total = @total + cart_item.item.with_tax_price * cart_item.amount
    end
    @order.total_payment = @total
    @order.customer_id = current_customer.id
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

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.price = cart_item.item.with_tax_price
      @order_detail.order_id = @order.id
      @order_detail.save
    end

    current_customer.cart_items.destroy_all
    redirect_to complete_orders_path
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :name, :address, :customer_id, :status, :shipping_cost, :total_payment)
  end

end
