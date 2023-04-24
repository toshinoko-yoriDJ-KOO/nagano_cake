class Admin::OrdersController < ApplicationController
  # before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
  end

  def update
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
    @order.update(order_params)

    if @order.order_status == Order.order_statuses.key(1)
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
    params.require(:order).permit(:order_status)
  end

end
