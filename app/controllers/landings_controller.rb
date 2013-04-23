class LandingsController < ApplicationController

  def new
    @landing = Landing.new
  end
end

