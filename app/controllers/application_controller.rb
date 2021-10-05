class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_orders_path
    when Customer
      root_path
    end
  end
  
  # def admin_user
  #   redirect_to(root_url) unless current_user.admin? 
  # end
  
end
