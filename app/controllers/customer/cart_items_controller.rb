class Customer::CartItemsController < ApplicationController
  # before_action :authenticate_customer!

  def index
     @cart_items = current_customer.cart_items.all
  # カート内商品の合計金額を求める
     @total = @cart_items.inject(0) { |sum, item| sum + product.sum_of_price }
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

private
  def cart_item_params
      params.require(:cart_item).permit(:product_id, :productamount)
  end