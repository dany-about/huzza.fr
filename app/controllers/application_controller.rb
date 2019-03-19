class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :check_achievements
  #before_action :browser_locale(current_user)

  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end


  def extract_locale_from_tld
    parsed_locale =  request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def check_achievements
    Participation.where(is_achieved: nil).each { |participation| 
      # Checks for contested proofs
      if true

        # ADD NOTIFICATION HERE
      end
      # Checks if any proofs have passed the review period without being contested
      if Time.now - participation.updated_at >= 3.days
        participation.is_achieved = true
        participation.user.elo_points += participation.dare.difficulty
        # ADD NOTIFICATION HERE
      end
    }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :terms_of_service]) 
  end

  def authenticate_user!
    redirect_to new_user_registration_path unless user_signed_in?
  end

end
