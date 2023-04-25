class Customer::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
     @cart_items = current_customer.cart_items.all
  # カート内商品の合計金額を求める
     @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to request.referer
    else
      render :index
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    redirect_to request.referer
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to cart_items_path
    else
      render :index
    end
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:customer_id, :product_id, :product_amount)
  end

end