class PassesController < ApplicationController
  before_action :load_pass, except: [:index, :new, :create]
  
  
  def index
   @passes = Pass.all
  end
  
  def new
    @pass = Pass.new
  end
  
  def create
    @pass = Pass.new pass_params
    if @pass.save
      redirect_to passes_path, notice: "Guest Pass Submitted!"
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @pass.update pass_params
      redirect_to @pass, notice: "Guest Pass Updated!"
    else
      render :edit
    end
  end
  
  def destroy
    @pass.destroy
    redirect_to passes_path, alert: "Guest Pass Deleted."
  end
  
  private
  
  def load_pass
    @pass = Pass.find params[:id]
  end
  
  def pass_params
    params.require(:pass).permit(:from,:code_id,:expiry,:code)
  end
end
