class Admin::DashboardController < ApplicationController
  before_filter :check_admin
  #layout :admin_layout

  def index
    @admin = current_user
    @users = User.all
  end

  def suspend_user
    @user = User.find(params[:id])
    if @user.suspended?
      @user.suspended = false
      @user.save
    else
      @user.suspended = true
      @user.save
    end
    respond_to do |format|
     format.js
    end
  end

  private

  def check_admin
    if current_user.admin?
      flash[:success] = "Here is your dashboard"
      #return true
    else
      redirect_to root_path
      flash[:error] = "You must be an admin to access this area."
    end
  end
end
