class Customer::HomesController < ApplicationController
  # before_action :authenticate_customer!
  def top
    @products = Product.all

  def about
  end
  
end
