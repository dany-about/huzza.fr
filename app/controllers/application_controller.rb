class ApplicationController < ActionController::Base
  before_action :set_locale
  #before_action :browser_locale(current_user)
  browser = Browser.new("Some User Agent", accept_language: "en-us")

  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end

  browser.
# Get locale from top-level domain or return +nil+ if such locale is not available
# You have to put something like:
#   127.0.0.1 application.com
#   127.0.0.1 application.it
#   127.0.0.1 application.pl
# in your /etc/hosts file to try this out locally
  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def browser_locale(request)
    locales = request.env['HTTP_ACCEPT_LANGUAGE'] || ""
    locales.scan(/[a-z]{2}(?=;)/).find do |locale|
      I18n.available_locales.include?(locale.to_sym)
    end
  end
end
