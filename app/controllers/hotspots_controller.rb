class HotspotsController < ApplicationController
  def create
    @hotspot = current_user.hotspots.build params[:hotspot]
    if @hotspot.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @hotspots = current_user.hotspots
  end

  def new
    @hotspot = Hotspot.new
    @hotspot.address = Address.new
  end
end

