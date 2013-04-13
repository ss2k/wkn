class HotspotsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @hotspot = Hotspot.new params[:hotspot]
    if @hotspot.save
      redirect_to hotspots_path
    else
      render :new
    end
  end

  def index
    @hotspots = Hotspot.all
  end

  def new
    @hotspot = Hotspot.new
  end
end

