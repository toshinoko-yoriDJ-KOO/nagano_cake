
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
  @order_product = OrderProduct.where(order_id: @order.id).first
  @order.update(order_params)

  if @order_product.production_status == OrderProduct.production_statuses.key(1)
    @order_items = OrderItem.where(params[:order_id])
    @order_items.each do |order_item|
      order_item.production_status = OrderItem.production_statuses.key(1)
      order_item.save
    end
  end

  redirect_to request.referer

  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end