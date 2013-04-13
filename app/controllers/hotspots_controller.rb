class HotspotsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @hotspot = current_user.hotspots.build params[:hotspot]
    if @hotspot.save
      redirect_to hotspots_path
    else
      render :new
    end
  end

  def index
    @hotspots = current_user.hotspots
  end

  def new
    @hotspot = Hotspot.new
  end
end

