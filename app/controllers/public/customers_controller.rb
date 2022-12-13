class Public::CustomersController < ApplicationController
  
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end
  
end