class Ticket < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :status, inclusion: { in: %w[open pending closed], message: "%{value} must be one of open, pending, or closed" }

  def status_description
    # Create a status_description method that returns a message based on the ticket's status: "open", "pending", "closed", or "Unknown status" for any other values.
    # When the ticket is 'open' the message should be "Ticket is open and needs attention."
    # When the ticket is 'pending' the message should be "Ticket is pending and awaiting action."
    # When the ticket is 'closed' the message should be "Ticket has been resolved."
    # When status is unclear, the message should be "Unknown status."
  end
end