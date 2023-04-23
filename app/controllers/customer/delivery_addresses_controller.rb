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
    if @delivery_address.save
      redirect_to request.referer
    else
      @delivery_addresses = DeliveryAddress.all
      render :index
    end
  end

  def update
  end

  def destroy
    @delivery_address = DeliveryAddress.find(params[:id])
    @delivery_address.destroy
    redirect_to "/delivery_addresses"
  end
  
  
  private
  
  def delivery_address_params
    params.require(:delivery_address).permit(:delivery_address_zip_code, :delivery_address_other, :delivery_address_name)
  end
end
