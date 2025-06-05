class TicketsController < ApplicationController
  def index
    render json: Ticket.all.map { |t| ticket_json(t) }
  end

  def create
    # Implement the create action to allow the creation of a new ticket, ensure that the ticket is saved and returns a JSON response with the ticket details.
  end

  def update
    # Implement the update action to allow updating an existing ticket.
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description, :status, :user_id).to_h.symbolize_keys
  end

  def ticket_json(ticket)
    {
      id: ticket.id,
      title: ticket.title,
      description: ticket.description,
      status: ticket.status
    }
  end
end