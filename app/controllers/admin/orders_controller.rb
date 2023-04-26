
class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
    @order_product = OrderProduct.where(order_id: @order.id)
    @order_products = @order.order_products
  end

  def update
  @order = Order.find(params[:id])
  @order_products = OrderProduct.where(order_id: @order.id)
  @order.update(order_params)

  if @order.status == Order.statuses.key(1)
    @order_products.each do |order_product|
      order_product.making_status = OrderProduct.making_statuses.key(1)
      order_product.save
    end
  end

  redirect_to request.referer

  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end