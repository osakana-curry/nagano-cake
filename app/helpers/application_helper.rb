module ApplicationHelper
  def current_cart
    @cart= current_customer.carts
  end
end
