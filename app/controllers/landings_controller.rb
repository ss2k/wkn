class LandingsController < ApplicationController
  def create
    @hotspot = Hotspot.find params[:hotspot_id]
    @landing = @hotspot.landings.build params[:landing]
    if @landing.save
      redirect_to @hotspot
    else
      render :new
    end
  end

  def new
    @hotspot = Hotspot.find params[:hotspot_id]
    @landing = @hotspot.landings.new
  end
end

