class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale

  def public_ip
    request.remote_ip
  end

  def set_locale

    if user_country == 'Brazil'
      I18n.locale = 'pt' || I18n.default_locale
    else
      I18n.locale = 'en' || I18n.default_locale
    end

  end

  def user_country
    geolocation = open('http://freegeoip.net/json/'+public_ip).read
    JSON.parse(geolocation)['country_name']
  end

end