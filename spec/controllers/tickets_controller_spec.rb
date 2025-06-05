require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  let(:valid_attributes) { { title: 'Test Ticket', description: 'Test desc', status: 'open' } }
  let(:invalid_attributes) { { title: '', description: 'Desc', status: 'invalid' } }

  describe 'GET #index' do
    it 'returns all tickets' do
      ticket = Ticket.create(valid_attributes)
      get :index, format: :json
      expect(response).to have_http_status(:ok)
      body = JSON.parse(response.body)
      expect(body.size).to be >= 1
      expect(body.any? { |t| t['title'] == 'Test Ticket' }).to be true
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new ticket' do
        expect {
          post :create, params: { ticket: valid_attributes }, format: :json
        }.to change { Ticket.all.size }.by(1)
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'returns unprocessable entity and errors' do
        post :create, params: { ticket: invalid_attributes }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        body = JSON.parse(response.body)
        expect(body['errors']['title']).to include("can't be blank")
        expect(body['errors']['status']).to include('must be one of open, pending, closed')
      end
    end
  end

  describe 'PUT #update' do
    let!(:ticket) { Ticket.create(valid_attributes) }

    context 'with valid params' do
      let(:new_attributes) { { title: 'Updated Title', status: 'pending' } }

      it 'updates the ticket' do
        put :update, params: { id: ticket.id, ticket: new_attributes }, format: :json
        expect(response).to have_http_status(:ok)
        ticket.reload
        expect(ticket.title).to eq('Updated Title')
        expect(ticket.status).to eq('pending')
      end
    end

    context 'with invalid params' do
      it 'returns errors' do
        put :update, params: { id: ticket.id, ticket: invalid_attributes }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        body = JSON.parse(response.body)
        expect(body['errors']['title']).to include("can't be blank")
      end
    end

    context 'with non-existent ticket' do
      it 'returns not found' do
        put :update, params: { id: 99999, ticket: valid_attributes }, format: :json
        expect(response).to have_http_status(:not_found)
        body = JSON.parse(response.body)
        expect(body['error']).to eq('Ticket not found')
      end
    end
  end
end
