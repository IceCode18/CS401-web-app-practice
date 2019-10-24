class CouponsController < ApplicationController
  before_action :load_pass
  
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
    @coupon = @pass.coupons.find params[:id]
  end  
    
  
  private
  
  def load_pass
    @pass = Pass.find params[:pass_id]
  end
  
  def coupon_params
    params.require(:coupon).permit(:code, :code_expiry, :note, :claimer)
  end
  
end
