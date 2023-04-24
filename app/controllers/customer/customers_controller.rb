class Customer::CustomersController < ApplicationController
    before_action :authenticate_customer!

    def show
        @customer = Customer.find(current_customer.id)
    end

    def edit
        @customer =Customer.find(current_customer.id)
    end

    def update
    end

    def quit
    end

    def out
        current_customer.update(status: 'quit')
        reset_session
        redirect_to root_path
    end

private

    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number)
    end
end
