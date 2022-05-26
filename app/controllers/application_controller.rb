class ApplicationController < ActionController::Base

   before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
       admin_orders_path
    else
       root_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
       admin_session_path
    else
       about_path
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:last_name,:first_name,:last_name_kana,:first_name_kana,:address,:postcode,:phone_number])
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

end
