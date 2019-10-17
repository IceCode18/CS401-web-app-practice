class PassesController < ApplicationController
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
    @pass = Pass.find params[:id]
  end
  
  def edit
    @pass = Pass.find params[:id]
  end
  
  def update
    @pass = Pass.find params[:id]
    if @pass.update pass_params
      redirect_to @pass, notice: "Guest Pass Updated!"
    else
      render :edit
    end
  end
  
  private
  
  def pass_params
    params.require(:pass).permit(:from,:code_id,:expiry,:code)
  end
end
