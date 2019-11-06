class CouponsController < ApplicationController
  before_action :authenticate
  before_action :load_pass
  before_action :load_coupon, except: [:index, :new, :create]
  
  def index
    @coupons = @pass.coupons
  end
  
  def new
    @coupon = Coupon.new
  end  
  
  def create
    @coupon = Coupon.new coupon_params
    if @pass.coupons << @coupon
      redirect_to pass_coupons_path(@pass), notice: "Coupon Saved!"
    else
      render :new
    end
  end
  
  def show
  end  
  
  def edit
  end
  
  def update
    if @coupon.update coupon_params
      redirect_to [@pass,@coupon], notice: "Coupon Updated!"
    else
      render :edit
    end
  end

  def destroy
    @coupon.destroy
    redirect_to pass_coupons_path(@pass), alert: "Coupon Deleted."
  end
  
  private
  
  def load_pass
    @pass = current_user.passes.find params[:pass_id]
  end
  
  def load_coupon
     @coupon = @pass.coupons.find params[:id]
  end
  
  def coupon_params
    params.require(:coupon).permit(:code, :code_expiry, :note, :claimer)
  end
  
end
