class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Devise
  # before_action :devise_configure_permitted_parameters, if: :devise_controller?

  # private

  # Devise
  # def devise_configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :address])
  # end

end
