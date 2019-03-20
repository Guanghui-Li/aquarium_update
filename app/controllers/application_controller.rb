class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  layout :layout

  private
    # def configure_permitted_parameters
    #   update_attrs = [:password, :password_confirmation, :current_password]
    #   devise_parameter_sanitizer.permit :account_update, keys: update_attrs
    # end
  
    def record_not_found
      redirect_to "/livestocks"
      flash[:danger] = "The page you are looking for does not exist"
    end
  
    def layout
      # only turn it off for login pages:
      is_a?(Devise::SessionsController) ? false : "application"
      # or turn layout off for every devise controller:
      !devise_controller? && "application"
    end
end
