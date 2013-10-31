class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def public_ip
    request.remote_ip
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    redirect_to root_url
  end

end