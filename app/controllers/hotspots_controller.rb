class HotspotsController < ApplicationController
  before_filter :check_if_suspended, :except => :display

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

  def display
    #@hotspot = current_user.hotspots.find(params[:id])
    @hotspot = Hotspot.where(name: params[:id]).first
    @landing = @hotspot.landings.first
    if @landing.nil?
      redirect_to root_url
      flash[:error] = "No Hotspot Page Found"
    end
    #@landing = current_user.hotspots.landing
  end

  def update
    @hotspot = current_user.hotspots.find params[:id]
    if @hotspot.update_attributes params[:hotspot]
      redirect_to @hotspot
    else
      render :edit
    end
  end

  private 
  def check_if_suspended #This checks if a user is suspended or not before proceeding
    if current_user.try(:suspended?) #Do not want to cause an error incase there is no user
      sign_out current_user
      redirect_to new_user_session_path
      flash[:error] = "Your account has been suspended"
    elsif current_user.nil? #if there is no user, redirect to sign in
      redirect_to new_user_session_path
    end
  end
end

