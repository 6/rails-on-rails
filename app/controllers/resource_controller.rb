class ResourceController < ApplicationController
  load_and_authorize_resource
  check_authorization
  rescue_from CanCan::AccessDenied do |exception|
    url = current_user.present? ? root_url : login_url
    redirect_to url, :alert => exception.message
  end
  
  private
  
  def extract_params(key, params_list, unkeyed_params_list = [])
    new_params = {}
    params_list.each do |par|
      new_params[par] = params[key][par]
    end
    unkeyed_params_list.each do |par|
      new_params[par] = params[par]
    end
    new_params
  end
end
