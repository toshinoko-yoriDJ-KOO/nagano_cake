class Customer::HomesController < ApplicationController

  def top
    @products = Product.all
  end

  def about
  end

  def product_params
    params.require(:home).permit(:image)
  end

end
