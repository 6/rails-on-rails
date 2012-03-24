class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_debug

  def set_debug
    @debug = Rails.env.development? || params[:debug].present? ? 'yes' : 'no'
  end
end
