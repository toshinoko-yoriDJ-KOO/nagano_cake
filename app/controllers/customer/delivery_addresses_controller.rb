class Customer::DeliveryAddressesController < ApplicationController
  # before_action :authenticate_customer!
  
  def new
    @delivery_address = DeliveryAddress.new
  end
  
  def index
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
