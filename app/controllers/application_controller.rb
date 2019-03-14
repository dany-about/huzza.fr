class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :browser_locale(current_user)

  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end


  def extract_locale_from_tld
    parsed_locale = request.env['HTTP_ACCEPT_LANGUAGE'][0..1]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options
    { locale: I18n.locale }
  end

  
  def after_sign_in_path_for(resource_or_scope)
   current_user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

end
