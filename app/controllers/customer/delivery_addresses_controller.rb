class Customer::DeliveryAddressesController < ApplicationController
  # before_action :authenticate_customer!

  def new
    @delivery_address = DeliveryAddress.new
  end

  def index
    @delivery_addresses = DeliveryAddress.all
  end

  def edit
    @delivery_address = DeliveryAddress.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
    @delivery_address = DeliveryAddress.find(params[:id])
    @delivery_address.destroy
    redirect_to "/delivery_addresses"
  end
end
