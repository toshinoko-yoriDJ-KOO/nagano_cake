class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
    @delivery_addresses = current_customer.delivery_addresses.all
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.shopping_cost = 800
    @total = 0
    if params[:order][:address_select] == "customer_address"
      @order.postal_code = current_customer.zip_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_select] == "delivery_address_other"
      address = DeliveryAddress.find(params[:order][:address_id])
      @order.postal_code = address.delivery_address_zip_code
      @order.address = address.delivery_address_other
      @order.name = address.delivery_address_name
    end
  end


  def thanks
  end

  def create
    order = current_customer.orders.new(order_params)
    order.status = 0
    order.save
    current_customer.cart_items.each do |cart_item|
      order_product = OrderProduct.new(
        order_id: order.id,
        product_id: cart_item.product.id,
        price: cart_item.product.price,
        amount: cart_item.product_amount,
        making_status: 0)
    order_product.save!
    cart_item.destroy
    end
  redirect_to orders_thanks_path

  end

  def index
    @order = Order.all
  end

  def show
    @order = current_customer.orders.find(params[:id])
    
    @total = 0
  end

private

  def order_params
    params.require(:order).permit(:customer_id, :total_payment, :shopping_cost, :payment_method, :name, :address, :postal_code, :status)
  end
end
