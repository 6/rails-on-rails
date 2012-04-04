class OauthsController < ApplicationController
  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def oauth
    login_at(params[:provider])
  end
      
  def callback
    provider = params[:provider]
    begin
      if @user = login_from(provider)
        redirect_to root_path
      else      
        @user = create_from(provider)
        # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule

        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to root_path
      end
    rescue
      redirect_to root_path, :alert => "Failed to login from #{provider.titleize}!"
    end
  end
end
