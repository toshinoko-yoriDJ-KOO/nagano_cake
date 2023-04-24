class Admin::Order_Products_Controller < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_items = @order.order_items.all

    @order_item.update(item_params)

    if @order_items.where(production_status: 2).count >= 1
      @order.order_status = 2
      @order.save
    end

    if @order_items.where(production_status: 3).count == @order_items.count
      @order.order_status = 3
      @order.save
    end

    redirect_to request.referer
  end

  private

  def item_params
    params.require(:order_item).permit(:production_status)
  end

end
