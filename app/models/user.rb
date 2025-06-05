class User < ApplicationRecord
  has_many :tickets, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def closed_tickets
    # return the user's closed tickets
  end

  def active_tickets
    # return the user's open or pending tickets
  end

  def most_recent_ticket
    # return the user's most recent ticket
  end
end