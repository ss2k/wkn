class PublicationsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :show
  layout false

  def show
    @hotspot = Hotspot.where(['? = name', params[:publication]]).first
  end
end

