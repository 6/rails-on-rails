class HomeController < ApplicationController
  before_filter :require_login, :only => :secret
end
