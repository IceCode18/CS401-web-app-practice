class PublicCouponsController < ApplicationController
  before_action :load_public, except: [:index]
  
  def index
    @public_coupons = PublicCoupon.all
  end

  def show
  end
  
  def publish
    cpub_id = "#{current_user.id},#{@pass.id},#{@coupon.id}"
    existing = PublicCoupon.where(pub_id: cpub_id).first
    if existing
      @coupon.publicized = false
      @coupon.save
      existing.destroy
    else
      pubcoup = PublicCoupon.new
      pubcoup.from = current_user.name
      pubcoup.pub_id = cpub_id
      puts "#{pubcoup.pub_id}"
      pubcoup.site = @pass.from
      pubcoup.code = @coupon.code
      pubcoup.expiry = @coupon.code_expiry
      pubcoup.claimer = @coupon.claimer
      pubcoup.note = @coupon.note
      pubcoup.save
      @coupon.publicized = true
      @coupon.save
    end
    redirect_to pass_coupons_path(@pass)
  end
  
  private
  
  def load_public
    @pass = current_user.passes.find params[:pass_id]
    @coupon = @pass.coupons.find params[:id]
  end
  
end
