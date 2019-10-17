class PassesController < ApplicationController
  def index
   @passes = Pass.all
  end
  
  def new
    @pass = Pass.new
  end

end
