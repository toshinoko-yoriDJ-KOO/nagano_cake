class Customer::ProductsController < ApplicationController
  # before_action :authenticate_customer!
  def index
    @products = Product.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    @cart_item =CartItem
  end
  
private

  def product_params
    params.require(:product).permit(:name, :description, :price, :is_active, :amount)
  end
end