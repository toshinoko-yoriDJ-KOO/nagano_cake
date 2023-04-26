class Admin::OrderProductsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products.all
  end

  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(order_product_params)
    @order = @order_product.order

    if @order.order_products.where(making_status: 2).count >= 1
      @order.status = 2
      @order.save
    end

    if @order.order_products.where(making_status: 3).count == @order.order_products.count
      @order.status = 3
      @order.save
    end

    redirect_to admin_order_path(@order)
  end

  private

  def order_product_params
    params.require(:order_product).permit(:making_status)
  end
end
