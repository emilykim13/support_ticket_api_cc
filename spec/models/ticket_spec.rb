require 'rails_helper'

RSpec.describe Ticket do
  describe 'validations' do
    it 'is valid with valid attributes' do
      ticket = Ticket.new(title: 'Sample Ticket', description: 'Some description', status: 'open')
      expect(ticket.valid?).to be true
      expect(ticket.errors).to be_empty
    end

    it 'is invalid without a title' do
      ticket = Ticket.new(title: '', description: 'Desc', status: 'open')
      expect(ticket.valid?).to be false
      expect(ticket.errors[:title]).to include("can't be blank")
    end

    it 'is invalid with an invalid status' do
      ticket = Ticket.new(title: 'Title', description: 'Desc', status: 'invalid_status')
      expect(ticket.valid?).to be false
      expect(ticket.errors[:status]).to include('must be one of open, pending, closed')
    end
  end

  describe '.create' do
    it 'adds the ticket to the store if valid' do
      expect {
        Ticket.create(title: 'New Ticket', description: 'Desc', status: 'open')
      }.to change { Ticket.all.size }.by(1)
    end

    it 'does not add the ticket if invalid' do
      expect {
        Ticket.create(title: '', description: 'Desc', status: 'open')
      }.not_to change { Ticket.all.size }
    end
  end

  describe '#update' do
    let!(:ticket) { Ticket.create(title: 'Old Title', description: 'Old Desc', status: 'open') }

    it 'updates valid attributes' do
      success = ticket.update(title: 'New Title', status: 'pending')
      expect(success).to be true
      expect(ticket.title).to eq('New Title')
      expect(ticket.status).to eq('pending')
    end

    it 'does not update with invalid attributes' do
      success = ticket.update(title: '', status: 'badstatus')
      expect(success).to be false
      expect(ticket.errors[:title]).to include("can't be blank")
      expect(ticket.errors[:status]).to include('must be one of open, pending, closed')
    end
  end
end
