class UsersController < ApplicationController
  before_action :authenticate, except: [:new, :create]
  before_action :load_user, except: [:index, :new, :create]
  
  def index
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new user_params
    if @user.save
      login(@user)
      redirect_to root_path, notice: "Acoount Created."
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
