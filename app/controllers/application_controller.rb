class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u|
      u.permit(:name, :email, :password, :firstname, :lastname, :date_of_birth, :avatar, :password_confirmation)
    }

    devise_parameter_sanitizer.permit(:account_update) { |u|
      u.permit(:name, :email, :password, :current_password, :firstname, :lastname, :date_of_birth, :avatar, :password_confirmation)
    }
  end
end
