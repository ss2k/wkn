class HotspotsController < ApplicationController
  def create
    @hotspot = current_user.hotspots.create params[:hotspot]
    if @hotspot.id
      redirect_to @hotspot
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

  def show
    @hotspot = current_user.hotspots.find params[:id]
  end
end

