class Admin::HomesController < ApplicationController
  
  def top
<<<<<<< HEAD
  
  end
=======
    @orders = Order.all.page(params[:page])
  end
  
>>>>>>> origin/develop
end



