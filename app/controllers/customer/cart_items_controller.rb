class Customer::CartItemsController < ApplicationController
  # before_action :authenticate_customer!

  def index
     @cart_items = CartItem.all
    # 本当はcurrent_customer.cart.items
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
  end
end
