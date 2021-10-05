class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_orders_path
    when Customer
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when Admin
      new_admin_session_path
    when Customer
      root_path
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                        keys:[:last_name, :first_name,
                                              :last_name_kana, :first_name_kana, :email,
                                              :encrypted_password, :postal_code, :address,
                                              :phone_number])
  end

  # def admin_user
  #   redirect_to(root_url) unless current_user.admin?
  # end

end
