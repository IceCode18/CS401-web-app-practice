class UsersController < ApplicationController
  before_action :authenticate, except: [:new, :create]
  before_action :load_user, except: [:index, :new, :create]
  
  def index
  end
  
  def new
    if session[:user_hash]
      @user = User.new_from_hash(session[:user_hash])
      @user.valid?
    else
      @user = User.new
    end
  end
  
  def create
    if session[:user_hash]
      @user = User.new_from_hash(session[:user_hash])
      @user.name = user_params[:name]
      @user.email = user_params[:email]
    else
      @user = User.new user_params
    end
    if @user.save
      session[:user_hash] = nil
      login(@user)
      redirect_to root_path, notice: "Account Created."
    else
      render :new
    end
  end
  
  def show
  end  
  
  def edit
  end
  
  def update
    if @user.update user_params
      redirect_to @user, notice: "User Settings Updated!"
    else
      render :edit
    end
  end
  
  
  def destroy
    @user.destroy
    logout
    redirect_to root_path, notice: "Acount Deleted."
  end
  
  private
  
  def load_user
    @user = current_user
  end
  
  def user_params
    params.require(:user).permit(:name,:email,:password, :password_confirmation)
  end
  
end
