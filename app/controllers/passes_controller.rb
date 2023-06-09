class PassesController < ApplicationController
  before_action :authenticate
  before_action :load_pass, except: [:index, :new, :create]
  
  # GET /pass
  # GET /pass.json
  def index
      @passes = current_user.passes
  end
  
  # GET /pass/new
  def new
    @pass = Pass.new
  end
  
  # POST /pass
  # POST /pass.json
  def create
    @pass = Pass.new pass_params
    @pass.user = current_user
    if @pass.save
      redirect_to passes_path, notice: "Guest Pass Submitted!"
    else
      render :new
    end
  end
  
  # GET /pass/1
  # GET /pass/1.json
  def show
  end
  
  # GET /pass/1/edit
  def edit
  end
  
  # PATCH/PUT /pass/1
  # PATCH/PUT /pass/1.json
  def update
    if @pass.update pass_params
      redirect_to @pass, notice: "Guest Pass Updated!"
    else
      render :edit
    end
  end
  
  # DELETE /pass/1
  # DELETE /pass/1.json
  def destroy
    @pass.destroy
    redirect_to passes_path, alert: "Guest Pass Deleted."
  end
  
  private
  
  def load_pass
    @pass = current_user.passes.find params[:id]
  end
  
  def pass_params
    params.require(:pass).permit(:from,:code_id,:expiry,:code)
  end
end
