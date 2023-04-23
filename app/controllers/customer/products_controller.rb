class Customer::ProductsController < ApplicationController
  # before_action :authenticate_customer!
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
  
private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
