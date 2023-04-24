class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order.shipping_cost = 800
    @total = 0
  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
  end
end
