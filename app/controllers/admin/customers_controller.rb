class Admin::CustomersController < ApplicationController
  def show
    @customer=Customer.find(params[:id])
  end

  def index
    @customers=Customer.all
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
    @customer=Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path
  end
end
