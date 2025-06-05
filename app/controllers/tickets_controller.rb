class TicketsController < ApplicationController
  def index
    render json: Ticket.all.map { |t| ticket_json(t) }
  end

  def create
    ticket = Ticket.new(ticket_params)
    
    if ticket.save
      render json: ticket_json(ticket), status: :created
    else
      render json: { errors: ticket.errors }, status: :unprocessable_entity
    end
  end

  def update
    ticket = Ticket.find_by(id: params[:id])
    
    if ticket.nil?
      return render json: { error: 'Ticket not found' }, status: :not_found
    end

    if ticket.update(ticket_params)
      render json: ticket_json(ticket)
    else
      render json: { errors: ticket.errors }, status: :unprocessable_entity
    end
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
      status: ticket.status,
      status_description: ticket.status_description
    }
  end
end