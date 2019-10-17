class PassesController < ApplicationController
  def index
   @passes = Pass.all
  end
end
