class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def record_not_found
    redirect_to "/livestocks"
    flash[:danger] = "The page you are looking for does not exist"
  end
end
