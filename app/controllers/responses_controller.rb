class ResponsesController < ApplicationController
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @response = @ticket.responses.build(params[:response])
    @response.user_id = current_user.id
    if @response.save
      flash[:success] = "You have submitted a response"
      redirect_to user_ticket_path(@ticket.user, @ticket)
    else
      flash[:error] = "There was an error"
      redirect_to user_ticket_path(@ticket.user, @ticket)
    end
  end
end
