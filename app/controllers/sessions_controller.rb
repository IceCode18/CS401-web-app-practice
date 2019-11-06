class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.authenticate(params[:password])
      login(@user)
      redirect_to root_path, notice: "Logged In"
    else
      redirect_to login_path, alert: "Invalid email/password"
    end
  end
  
  def destroy
    logout
    redirect_to root_path, notice: "Logged out."
  end
  
end
