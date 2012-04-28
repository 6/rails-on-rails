class UsersController < ResourceController
  before_filter :require_not_login, :only => [:new]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      user = login(params[:user][:email], params[:user][:password], "1")
      return redirect_to root_url if user
    end
    flash.alert = @user.errors.full_messages.to_sentence if @user.errors.any?
    redirect_to signup_path(extract_params(:user, [:email, :full_name]))
  end
  
  def update
    @user = User.find(params[:id])
    valid_password = true
    if params[:user][:updating_password].present?
      @user.password = params[:user][:password]
      valid_password = @user.password.present?
    else
      @user.email = params[:user][:email]
      @user.full_name = params[:user][:full_name]
    end
    if valid_password and @user.save
      redirect_to @user, :notice => "Saved new profile information."
    else
      error = "Error updating your profile. "
      error += @user.errors.full_messages.to_sentence if @user.errors.any?
      error += "You must enter a password." unless valid_password
      flash.now[:notice] = error
      render :edit
    end
  end
end
