class CouponsController < ApplicationController
  before_action :load_pass
  
  def index
    @coupons = @pass.coupons
  end
  
  private
  
  def load_pass
    @pass = Pass.find params[:pass_id]
  end
  
  
end
