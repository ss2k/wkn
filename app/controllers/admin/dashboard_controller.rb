class Admin::DashboardController < ApplicationController
  before_filter :check_admin
  #layout :admin_layout

  def index
    @admin = current_user
    @users = User.all
  end

  private

  def check_admin
    if current_user.admin?
      return true
    else
      redirect_to root_path
      flash[:error] = "You must be an admin to access this area."
    end
  end
end
