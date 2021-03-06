class LandingsController < ApplicationController
  #impressionist
  
  def create
    @hotspot = find_hotspot
    @landing = @hotspot.landings.build params[:landing]
    if @landing.save
      redirect_to @hotspot
    else
      render :new
    end
  end

  def destroy
    @hotspot = find_hotspot
    @landing = @hotspot.landings.find params[:id]
    @landing.destroy
    redirect_to @hotspot
  end

  def edit
    @hotspot = find_hotspot
    @landing = @hotspot.landings.find params[:id]
  end

  def new
    @hotspot = find_hotspot
    @landing = @hotspot.landings.new
  end

  def update
    @hotspot = find_hotspot
    @landing = @hotspot.landings.find params[:id]
    if @landing.update_attributes params[:landing]
      flash[:notice] = 'The landing page was successfully updated.'
      redirect_to @hotspot
    else
      render :edit
    end
  end

  def show
    @hotspot = find_hotspot
    @landing = @hotspot.landings.find(params[:id])
  end

  private

  def find_hotspot
    current_user.hotspots.find params[:hotspot_id]
  end
end

