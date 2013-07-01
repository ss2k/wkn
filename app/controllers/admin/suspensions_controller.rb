class Admin::SuspensionsController < ApplicationController
  before_filter :check_if_admin
  
  def new
    @user = User.find(params[:id])
    @user.suspended = true
    @user.save
    respond_to do |format|
     format.js
    end
  end

  def destroy
    user = User.find(params[:id])
    user.suspended = false
    user.save
    respond_to do |format|
      format.js
    end
  end

  private

  def check_if_admin
    if !current_user.admin?
      flash[:error] = "You must be an admin to do that"
      redirect_to root_path
    end
  end
end
