class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_request_path
  # before_action :display_welcome_flash, if: :user_sign1ed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def default_url_options
    I18n.default_locale == I18n.locale ? {} : { lang: I18n.locale }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end


  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def display_welcome_flash
    flash[:welcome] = "Привет, #{current_user.first_name}!"
  end

  def set_request_path
    session[:request_path] = request.path
  end

end
