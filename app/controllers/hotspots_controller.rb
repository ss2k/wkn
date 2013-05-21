class HotspotsController < ApplicationController
  def create
    @hotspot = current_user.hotspots.create params[:hotspot]
    if @hotspot.id
      @hotspot.make_admin!(current_user)
      redirect_to @hotspot
    else
      render :new
    end
  end

  def edit
    @hotspot = current_user.hotspots.find params[:id]
  end

  def destroy
    @hotspot = current_user.hotspots.find params[:id]
    @hotspot.destroy
    redirect_to root_path
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
    @editorship = current_user.editorships.find_by_hotspot_id(@hotspot.id)
  end

  def update
    @hotspot = current_user.hotspots.find params[:id]
    if @hotspot.update_attributes params[:hotspot]
      redirect_to @hotspot
    else
      render :edit
    end
  end
end

