class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :password_digest)
    @user = User.find_by(user_params)

    if @user
      login(@user)
      flash[:notice] = "Successfully logged in."
      redirect_to user_path(@user)
    else
      flash[:error] = "Email or password incorrect"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully logged out"
    redirect_to root_path
  end


  private


  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

end
