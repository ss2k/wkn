class LandingsController < ApplicationController
  def create
    @hotspot = current_user.hotspots.find params[:hotspot_id]
    @landing = @hotspot.landings.build params[:landing]
    if @landing.save
      redirect_to @hotspot
    else
      render :new
    end
  end

  def new
    @hotspot = current_user.hotspots.find params[:hotspot_id]
    @landing = @hotspot.landings.new
  end
end

