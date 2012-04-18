class SessionsController < ApplicationController
  before_filter :require_not_login, :only => [:new]
  
  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url
    else
      u = User.find_by_email(params[:email])
      if u.andand.lock_expires_at and Time.now < u.lock_expires_at
        flash.alert = "Too many failed login attempts. Try again in #{((u.lock_expires_at - Time.now) / 60).ceil} minute(s)."
      else
        flash.alert = "Email or password was invalid."
      end
      redirect_to login_path(:email => params[:email])
    end
  end
  
  def destroy
    logout
    redirect_to root_url
  end
end
