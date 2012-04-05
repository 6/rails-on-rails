class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url
    else
      flash.alert = "Email or password was invalid."
      redirect_to login_path(:email => params[:email])
    end
  end
  
  def destroy
    logout
    redirect_to root_url
  end
end
