class TicketsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_user, except: :resolve_ticket

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
    @submitted_responses = @ticket.responses if @ticket.responses.exists?
  end

  def resolve_ticket
    @ticket = Ticket.find(params[:id])
    if current_user == @ticket.user || current_user.admin?
      @ticket.resolved = true
      if @ticket.save
        flash[:success] = "Ticket has been resolved"
        redirect_to user_ticket_path(@ticket.user, @ticket)
      else
        flash[:error] = "There was an error"
        redirect_to user_ticket_path(@ticket.user, @ticket)
      end
    else
      flash[:error] = "You do not have permission to resolve this ticket"
      redirect_to root_url
    end
  end

  private
  
  def authorize_user  
    if params[:user_id].to_i == current_user.id || current_user.admin?
      return true
    else
      flash[:error] = "You are not authorized to view this page"
      redirect_to root_url
    end
  end
end
