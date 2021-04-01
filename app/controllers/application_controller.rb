class ApplicationController < ActionController::Base
<<<<<<< Updated upstream
  
  private

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :family_name, :first_name_kana, :family_name_kana, :birth_day])
  end
=======
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  # rescue_from Exception, with: :rescue_from_exception

  protected
>>>>>>> Stashed changes

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end