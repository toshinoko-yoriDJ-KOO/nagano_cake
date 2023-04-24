class Customer::DeliveryAddressesController < ApplicationController
  before_action :authenticate_customer!

  def new
    @delivery_address = DeliveryAddress.new
  end

  def index
    @delivery_addresses = DeliveryAddress.all
    @delivery_address = DeliveryAddress.new
  end

  def edit
    @delivery_address = DeliveryAddress.find(params[:id])
  end

  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    @delivery_address.customer_id = current_customer.id
    if @delivery_address.save
      redirect_to request.referer
    else
      render :index
    end
  end

  def update
    @delivery_address = DeliveryAddress.find(params[:id])
    @delivery_address.update
    redirect_to '/delivery_addresses'
  end

  def destroy
    @delivery_address = DeliveryAddress.find(params[:id])
    @delivery_address.destroy
    redirect_to '/delivery_addresses'
  end
  
  
  private
  
  def delivery_address_params
    params.require(:delivery_address).permit(:delivery_address_zip_code, :delivery_address_other, :delivery_address_name)
  end
end
