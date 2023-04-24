class Customer::CustomersController < ApplicationController
    before_action :authenticate_customer!

    def show
        @customer = Customer.find(params[:id])
    end

    def edit
    end

    def update
    end

    def quit
    end

    def out
    end
    
private

    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number)
    end
end
