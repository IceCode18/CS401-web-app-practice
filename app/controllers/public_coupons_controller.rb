class PublicCouponsController < ApplicationController
  before_action :load_public, except: [:index, :publish]
  
  def index
    @public_coupons = PublicCoupon.all
  end

  def show
  end
  
  def publish
  end
  
  private
  
  def load_public
    @public_coupon = PublicCoupon.find params[:id]
  end
  
end
