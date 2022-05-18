class Customer::AddressesController < ApplicationController

  def index
    @address = Address.new
  end

  def create
    @address = Address.new
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
