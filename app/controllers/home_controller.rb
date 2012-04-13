class HomeController < ApplicationController
  before_filter :require_login, :only => :secret
  
  def index
    @users = User.all
  end
end
