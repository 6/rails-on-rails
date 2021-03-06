class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_debug, :set_locale, :disable_if_maintenance
  respond_to :html, :json

  private
  
  def require_not_login
    redirect_to root_url if current_user.present?
  end
  
  def set_debug
    @debug = Rails.env.development? || params[:debug].present? ? 'yes' : 'no'
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    @locale = I18n.locale
  end
  
  def not_authenticated
    redirect_to login_url, :alert => "You have to login to view this page."
  end
  
  def disable_if_maintenance
    render :text => "We're currently under maintenance. Please try again in a few minutes." if Setting.maintenance_mode
  end
end
