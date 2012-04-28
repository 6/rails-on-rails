class ResourceController < ApplicationController
  load_and_authorize_resource
  check_authorization
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  private
  
  def extract_params(key, params_list)
    new_params = {}
    params_list.each do |par|
      new_params[par] = params[key][par]
    end
    new_params
  end
end
