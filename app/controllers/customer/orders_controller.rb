class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.shopping_cost = 800
    @total = 0
    if params[:order][:address_select] == "customer_address"
    @order.address = current_customer.address
    end
  end
  

  def thanks
  end

  def create
  end

  def index
    @order = Order.all
  end

  def show
    @order = orders.find(params[:id])
  end
  
  private
  
  def order_params
    params.require(:order).permit(:total_payment, :shipping_cost, :payment_method, :name, :address, :postal_code, :status)
  end

end