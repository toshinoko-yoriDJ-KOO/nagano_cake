class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "Customer was successfully updated"
      redirect_to admin_customer_path
    else
      render "show"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:is_deleted, :last_name, :first_name, :first_name_kana, :last_name_kana, :zip_code, :address, :phone_number, :email, :is_active)
  end
end
