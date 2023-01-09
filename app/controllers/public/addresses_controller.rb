class Public::AddressesController < ApplicationController
  
  def index
    @customer = Customer.find(current_customer.id)
    @addresses = @customer.addresses.all
    @address = Address.new
  end
  
  def edit
    @address = Address.find(params[:id])
  end

  
  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name, :customer_id)
  end
  
end
