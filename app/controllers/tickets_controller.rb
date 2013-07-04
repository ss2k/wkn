class TicketsController < ApplicationController
  before_filter :authenticate_user!
  #before_filter :authorize_user

  def index
    @user = User.find(params[:user_id])
    @tickets = @user.tickets
  end

  def new
    @user = User.find(params[:user_id])
    @ticket = @user.tickets.build
  end

  def create
    @user = User.find(params[:user_id])
    @ticket = @user.tickets.build(params[:ticket])
    if @ticket.save
      flash[:success] = "New ticket has been created."
      redirect_to user_tickets_path(current_user)
    else
      flash[:error] = "There was a problem creating the ticket."
      render new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @ticket = @user.tickets.find(params[:id])
  end

  private
  
  def authorize_user  
    binding.pry
    if params[:user_id] == current_user.id || current_user.admin?
      return true
    else
      flash[:error] = "You are not authorized to view this page"
      redirect_to root_url
    end
  end
end
