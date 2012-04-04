class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      user = login(params[:user][:email], params[:user][:password], nil)
      return redirect_to root_url if user
    end
    flash.now.alert = @user.errors.full_messages.to_sentence if @user.errors.any?
    render :new
  end
end