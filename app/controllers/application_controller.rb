class ApplicationController < ActionController::Base
  before_action :set_locale, :check_achievements, :check_accomplishments, :set_dummy_user
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

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
      # Checks for contested proofs of achievement
      if participation.contestations.count >= 5
        participation.update(is_achieved: false)
        participation.pictures.destroy_all
        participation.contestations.destroy_all
        # TO DO : ADD NOTIFICATION HERE
      end
      # Checks if any alledgedly achieved participations have passed the review period without being contested
      if participation.is_achieved == nil && Time.now - participation.updated_at >= 3.days
        participation.update(is_achieved: true)
        exp = participation.user.elo_points 
        exp += participation.dare.difficulty
        exp.save
        # TO DO : ADD NOTIFICATION HERE
      end
    }
  end

  def check_accomplishments
    if user_signed_in? && !current_user.is_fake?
      Accomplishment.all.each { |accomplishment| 
        if accomplishment.condition_satisfied_by(current_user)
          UserAccomplishment.create!(user: current_user, accomplishment: accomplishment) unless UserAccomplishment.find_by(user: current_user, accomplishment: accomplishment) != nil
          # TO DO : ADD NOTIFICATION HERE, using accomplishment.name          
        end
      }
    end
  end

  def set_dummy_user
    @current_user = User.create!(email:"#{rand(100000)}fake#{rand(100000)}@fake.fake", password: "123456", password_confirmation: '123456', first_name: "Fake", last_name: "User") unless user_signed_in?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :terms_of_service]) 
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || dares_path
  end

  def after_sign_up_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || dares_path
  end
end
