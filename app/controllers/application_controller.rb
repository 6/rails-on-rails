class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_debug, :set_locale

  def set_debug
    @debug = Rails.env.development? || params[:debug].present? ? 'yes' : 'no'
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    @locale = I18n.locale
  end
end
